Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F57500DC4
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Apr 2022 14:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239824AbiDNMmm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 14 Apr 2022 08:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243470AbiDNMml (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 14 Apr 2022 08:42:41 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FBC3FBE4
        for <linux-watchdog@vger.kernel.org>; Thu, 14 Apr 2022 05:40:16 -0700 (PDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23EC44SC026308;
        Thu, 14 Apr 2022 12:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=V/huZT1DDOAxNvA44SriZ+MlHxv9rszwRCOL5FminPw=;
 b=Krxt2+PwE9mBNZNrdmjQfC2W2RzoX8Q+hIRA8N2Y5QmCc95WS+wL98Wqj7ajC6OcG+2Q
 QG8vdChWZpmUD4WZm6rzDyGx7l79Y3p83WG059//NbuBbzYsgvghARRO3lhS0+wg81nr
 aG90P98G/wJmecZ7d/G46DYFrzfvF1B3BpLFewJcoO8chcK2gb72pbLTTzty28TTkU7+
 afJv3UIok9DgQi9OKZ7+/6iii1lXuO4n3dgyMia22UiIRcKG1Ld89PP7vArL0wNd8QSh
 AxB26HeFxx/M07cn6/3zS5RbOvzNAVFh+yJDW+Ga7y34db6YDolWUaUqVfpNZ93rvDHr Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3fegjuv29d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Apr 2022 12:39:58 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23ECdwuf007752;
        Thu, 14 Apr 2022 12:39:58 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3fegjuv28u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Apr 2022 12:39:57 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23ECRoqV012867;
        Thu, 14 Apr 2022 12:39:56 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
        by ppma04wdc.us.ibm.com with ESMTP id 3fb1sa7a7k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Apr 2022 12:39:56 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 23ECdtI513173178
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Apr 2022 12:39:55 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3AA1DC605A;
        Thu, 14 Apr 2022 12:39:55 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1ADB6C6059;
        Thu, 14 Apr 2022 12:39:55 +0000 (GMT)
Received: from localhost (unknown [9.211.56.94])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu, 14 Apr 2022 12:39:55 +0000 (GMT)
From:   Nathan Lynch <nathanl@linux.ibm.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     bjking@linux.ibm.com, aik@ozlabs.ru, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Subject: Re: [RFC v1 0/2] Add driver for PAPR watchdog timers
In-Reply-To: <a9482495-ed8e-0847-ee47-eea212ee6ae6@roeck-us.net>
References: <20220413165104.179144-1-cheloha@linux.ibm.com>
 <a9482495-ed8e-0847-ee47-eea212ee6ae6@roeck-us.net>
Date:   Thu, 14 Apr 2022 07:39:54 -0500
Message-ID: <87k0brdejp.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rryqHNT1KT3w341X4ANlIEaDE2-tQX2b
X-Proofpoint-ORIG-GUID: 1-V8JWRtrkFQevJJciy64-uf8mcCrPXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_04,2022-04-14_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=769 impostorscore=0 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140068
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Guenter Roeck <linux@roeck-us.net> writes:
> Anyway, doesn't pseries support devicetree ? Why is this driver not
> instantiated through a devicetree node ?

It's not ideal, but this facility doesn't have a device tree
representation specified in the platform architecture. It has to be
discovered through hypervisor calls.
