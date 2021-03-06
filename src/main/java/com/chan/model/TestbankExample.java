package com.chan.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TestbankExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table testbank
     *
     * @mbggenerated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table testbank
     *
     * @mbggenerated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table testbank
     *
     * @mbggenerated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table testbank
     *
     * @mbggenerated
     */
    public TestbankExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table testbank
     *
     * @mbggenerated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table testbank
     *
     * @mbggenerated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table testbank
     *
     * @mbggenerated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table testbank
     *
     * @mbggenerated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table testbank
     *
     * @mbggenerated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table testbank
     *
     * @mbggenerated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table testbank
     *
     * @mbggenerated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table testbank
     *
     * @mbggenerated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table testbank
     *
     * @mbggenerated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table testbank
     *
     * @mbggenerated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table testbank
     *
     * @mbggenerated
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andTestIdIsNull() {
            addCriterion("TEST_ID is null");
            return (Criteria) this;
        }

        public Criteria andTestIdIsNotNull() {
            addCriterion("TEST_ID is not null");
            return (Criteria) this;
        }

        public Criteria andTestIdEqualTo(Integer value) {
            addCriterion("TEST_ID =", value, "testId");
            return (Criteria) this;
        }

        public Criteria andTestIdNotEqualTo(Integer value) {
            addCriterion("TEST_ID <>", value, "testId");
            return (Criteria) this;
        }

        public Criteria andTestIdGreaterThan(Integer value) {
            addCriterion("TEST_ID >", value, "testId");
            return (Criteria) this;
        }

        public Criteria andTestIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("TEST_ID >=", value, "testId");
            return (Criteria) this;
        }

        public Criteria andTestIdLessThan(Integer value) {
            addCriterion("TEST_ID <", value, "testId");
            return (Criteria) this;
        }

        public Criteria andTestIdLessThanOrEqualTo(Integer value) {
            addCriterion("TEST_ID <=", value, "testId");
            return (Criteria) this;
        }

        public Criteria andTestIdIn(List<Integer> values) {
            addCriterion("TEST_ID in", values, "testId");
            return (Criteria) this;
        }

        public Criteria andTestIdNotIn(List<Integer> values) {
            addCriterion("TEST_ID not in", values, "testId");
            return (Criteria) this;
        }

        public Criteria andTestIdBetween(Integer value1, Integer value2) {
            addCriterion("TEST_ID between", value1, value2, "testId");
            return (Criteria) this;
        }

        public Criteria andTestIdNotBetween(Integer value1, Integer value2) {
            addCriterion("TEST_ID not between", value1, value2, "testId");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("TITLE is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("TITLE is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("TITLE =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("TITLE <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("TITLE >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("TITLE >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("TITLE <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("TITLE <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("TITLE like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("TITLE not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("TITLE in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("TITLE not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("TITLE between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("TITLE not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andAnswerIsNull() {
            addCriterion("ANSWER is null");
            return (Criteria) this;
        }

        public Criteria andAnswerIsNotNull() {
            addCriterion("ANSWER is not null");
            return (Criteria) this;
        }

        public Criteria andAnswerEqualTo(String value) {
            addCriterion("ANSWER =", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotEqualTo(String value) {
            addCriterion("ANSWER <>", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerGreaterThan(String value) {
            addCriterion("ANSWER >", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerGreaterThanOrEqualTo(String value) {
            addCriterion("ANSWER >=", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLessThan(String value) {
            addCriterion("ANSWER <", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLessThanOrEqualTo(String value) {
            addCriterion("ANSWER <=", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLike(String value) {
            addCriterion("ANSWER like", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotLike(String value) {
            addCriterion("ANSWER not like", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerIn(List<String> values) {
            addCriterion("ANSWER in", values, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotIn(List<String> values) {
            addCriterion("ANSWER not in", values, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerBetween(String value1, String value2) {
            addCriterion("ANSWER between", value1, value2, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotBetween(String value1, String value2) {
            addCriterion("ANSWER not between", value1, value2, "answer");
            return (Criteria) this;
        }

        public Criteria andSendorIsNull() {
            addCriterion("SENDOR is null");
            return (Criteria) this;
        }

        public Criteria andSendorIsNotNull() {
            addCriterion("SENDOR is not null");
            return (Criteria) this;
        }

        public Criteria andSendorEqualTo(Integer value) {
            addCriterion("SENDOR =", value, "sendor");
            return (Criteria) this;
        }

        public Criteria andSendorNotEqualTo(Integer value) {
            addCriterion("SENDOR <>", value, "sendor");
            return (Criteria) this;
        }

        public Criteria andSendorGreaterThan(Integer value) {
            addCriterion("SENDOR >", value, "sendor");
            return (Criteria) this;
        }

        public Criteria andSendorGreaterThanOrEqualTo(Integer value) {
            addCriterion("SENDOR >=", value, "sendor");
            return (Criteria) this;
        }

        public Criteria andSendorLessThan(Integer value) {
            addCriterion("SENDOR <", value, "sendor");
            return (Criteria) this;
        }

        public Criteria andSendorLessThanOrEqualTo(Integer value) {
            addCriterion("SENDOR <=", value, "sendor");
            return (Criteria) this;
        }

        public Criteria andSendorIn(List<Integer> values) {
            addCriterion("SENDOR in", values, "sendor");
            return (Criteria) this;
        }

        public Criteria andSendorNotIn(List<Integer> values) {
            addCriterion("SENDOR not in", values, "sendor");
            return (Criteria) this;
        }

        public Criteria andSendorBetween(Integer value1, Integer value2) {
            addCriterion("SENDOR between", value1, value2, "sendor");
            return (Criteria) this;
        }

        public Criteria andSendorNotBetween(Integer value1, Integer value2) {
            addCriterion("SENDOR not between", value1, value2, "sendor");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNull() {
            addCriterion("CREATE_DATE is null");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNotNull() {
            addCriterion("CREATE_DATE is not null");
            return (Criteria) this;
        }

        public Criteria andCreateDateEqualTo(Date value) {
            addCriterion("CREATE_DATE =", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotEqualTo(Date value) {
            addCriterion("CREATE_DATE <>", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThan(Date value) {
            addCriterion("CREATE_DATE >", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("CREATE_DATE >=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThan(Date value) {
            addCriterion("CREATE_DATE <", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThanOrEqualTo(Date value) {
            addCriterion("CREATE_DATE <=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIn(List<Date> values) {
            addCriterion("CREATE_DATE in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotIn(List<Date> values) {
            addCriterion("CREATE_DATE not in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateBetween(Date value1, Date value2) {
            addCriterion("CREATE_DATE between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotBetween(Date value1, Date value2) {
            addCriterion("CREATE_DATE not between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andRightselectIsNull() {
            addCriterion("RIGHTSELECT is null");
            return (Criteria) this;
        }

        public Criteria andRightselectIsNotNull() {
            addCriterion("RIGHTSELECT is not null");
            return (Criteria) this;
        }

        public Criteria andRightselectEqualTo(String value) {
            addCriterion("RIGHTSELECT =", value, "rightselect");
            return (Criteria) this;
        }

        public Criteria andRightselectNotEqualTo(String value) {
            addCriterion("RIGHTSELECT <>", value, "rightselect");
            return (Criteria) this;
        }

        public Criteria andRightselectGreaterThan(String value) {
            addCriterion("RIGHTSELECT >", value, "rightselect");
            return (Criteria) this;
        }

        public Criteria andRightselectGreaterThanOrEqualTo(String value) {
            addCriterion("RIGHTSELECT >=", value, "rightselect");
            return (Criteria) this;
        }

        public Criteria andRightselectLessThan(String value) {
            addCriterion("RIGHTSELECT <", value, "rightselect");
            return (Criteria) this;
        }

        public Criteria andRightselectLessThanOrEqualTo(String value) {
            addCriterion("RIGHTSELECT <=", value, "rightselect");
            return (Criteria) this;
        }

        public Criteria andRightselectLike(String value) {
            addCriterion("RIGHTSELECT like", value, "rightselect");
            return (Criteria) this;
        }

        public Criteria andRightselectNotLike(String value) {
            addCriterion("RIGHTSELECT not like", value, "rightselect");
            return (Criteria) this;
        }

        public Criteria andRightselectIn(List<String> values) {
            addCriterion("RIGHTSELECT in", values, "rightselect");
            return (Criteria) this;
        }

        public Criteria andRightselectNotIn(List<String> values) {
            addCriterion("RIGHTSELECT not in", values, "rightselect");
            return (Criteria) this;
        }

        public Criteria andRightselectBetween(String value1, String value2) {
            addCriterion("RIGHTSELECT between", value1, value2, "rightselect");
            return (Criteria) this;
        }

        public Criteria andRightselectNotBetween(String value1, String value2) {
            addCriterion("RIGHTSELECT not between", value1, value2, "rightselect");
            return (Criteria) this;
        }

        public Criteria andErrorselect1IsNull() {
            addCriterion("ERRORSELECT_1 is null");
            return (Criteria) this;
        }

        public Criteria andErrorselect1IsNotNull() {
            addCriterion("ERRORSELECT_1 is not null");
            return (Criteria) this;
        }

        public Criteria andErrorselect1EqualTo(String value) {
            addCriterion("ERRORSELECT_1 =", value, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect1NotEqualTo(String value) {
            addCriterion("ERRORSELECT_1 <>", value, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect1GreaterThan(String value) {
            addCriterion("ERRORSELECT_1 >", value, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect1GreaterThanOrEqualTo(String value) {
            addCriterion("ERRORSELECT_1 >=", value, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect1LessThan(String value) {
            addCriterion("ERRORSELECT_1 <", value, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect1LessThanOrEqualTo(String value) {
            addCriterion("ERRORSELECT_1 <=", value, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect1Like(String value) {
            addCriterion("ERRORSELECT_1 like", value, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect1NotLike(String value) {
            addCriterion("ERRORSELECT_1 not like", value, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect1In(List<String> values) {
            addCriterion("ERRORSELECT_1 in", values, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect1NotIn(List<String> values) {
            addCriterion("ERRORSELECT_1 not in", values, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect1Between(String value1, String value2) {
            addCriterion("ERRORSELECT_1 between", value1, value2, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect1NotBetween(String value1, String value2) {
            addCriterion("ERRORSELECT_1 not between", value1, value2, "errorselect1");
            return (Criteria) this;
        }

        public Criteria andErrorselect2IsNull() {
            addCriterion("ERRORSELECT_2 is null");
            return (Criteria) this;
        }

        public Criteria andErrorselect2IsNotNull() {
            addCriterion("ERRORSELECT_2 is not null");
            return (Criteria) this;
        }

        public Criteria andErrorselect2EqualTo(String value) {
            addCriterion("ERRORSELECT_2 =", value, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect2NotEqualTo(String value) {
            addCriterion("ERRORSELECT_2 <>", value, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect2GreaterThan(String value) {
            addCriterion("ERRORSELECT_2 >", value, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect2GreaterThanOrEqualTo(String value) {
            addCriterion("ERRORSELECT_2 >=", value, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect2LessThan(String value) {
            addCriterion("ERRORSELECT_2 <", value, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect2LessThanOrEqualTo(String value) {
            addCriterion("ERRORSELECT_2 <=", value, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect2Like(String value) {
            addCriterion("ERRORSELECT_2 like", value, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect2NotLike(String value) {
            addCriterion("ERRORSELECT_2 not like", value, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect2In(List<String> values) {
            addCriterion("ERRORSELECT_2 in", values, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect2NotIn(List<String> values) {
            addCriterion("ERRORSELECT_2 not in", values, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect2Between(String value1, String value2) {
            addCriterion("ERRORSELECT_2 between", value1, value2, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect2NotBetween(String value1, String value2) {
            addCriterion("ERRORSELECT_2 not between", value1, value2, "errorselect2");
            return (Criteria) this;
        }

        public Criteria andErrorselect3IsNull() {
            addCriterion("ERRORSELECT_3 is null");
            return (Criteria) this;
        }

        public Criteria andErrorselect3IsNotNull() {
            addCriterion("ERRORSELECT_3 is not null");
            return (Criteria) this;
        }

        public Criteria andErrorselect3EqualTo(String value) {
            addCriterion("ERRORSELECT_3 =", value, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andErrorselect3NotEqualTo(String value) {
            addCriterion("ERRORSELECT_3 <>", value, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andErrorselect3GreaterThan(String value) {
            addCriterion("ERRORSELECT_3 >", value, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andErrorselect3GreaterThanOrEqualTo(String value) {
            addCriterion("ERRORSELECT_3 >=", value, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andErrorselect3LessThan(String value) {
            addCriterion("ERRORSELECT_3 <", value, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andErrorselect3LessThanOrEqualTo(String value) {
            addCriterion("ERRORSELECT_3 <=", value, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andErrorselect3Like(String value) {
            addCriterion("ERRORSELECT_3 like", value, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andErrorselect3NotLike(String value) {
            addCriterion("ERRORSELECT_3 not like", value, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andErrorselect3In(List<String> values) {
            addCriterion("ERRORSELECT_3 in", values, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andErrorselect3NotIn(List<String> values) {
            addCriterion("ERRORSELECT_3 not in", values, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andErrorselect3Between(String value1, String value2) {
            addCriterion("ERRORSELECT_3 between", value1, value2, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andErrorselect3NotBetween(String value1, String value2) {
            addCriterion("ERRORSELECT_3 not between", value1, value2, "errorselect3");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("STATUS is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Byte value) {
            addCriterion("STATUS =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Byte value) {
            addCriterion("STATUS <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Byte value) {
            addCriterion("STATUS >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Byte value) {
            addCriterion("STATUS >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Byte value) {
            addCriterion("STATUS <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Byte value) {
            addCriterion("STATUS <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Byte> values) {
            addCriterion("STATUS in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Byte> values) {
            addCriterion("STATUS not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Byte value1, Byte value2) {
            addCriterion("STATUS between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Byte value1, Byte value2) {
            addCriterion("STATUS not between", value1, value2, "status");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table testbank
     *
     * @mbggenerated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table testbank
     *
     * @mbggenerated
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}