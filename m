Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1497153BD9E
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jun 2022 19:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235859AbiFBRya (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Jun 2022 13:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237750AbiFBRy3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Jun 2022 13:54:29 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F1B2B12D3
        for <linux-watchdog@vger.kernel.org>; Thu,  2 Jun 2022 10:54:28 -0700 (PDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252H1Bt1015485;
        Thu, 2 Jun 2022 17:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=/AOMAB4jrHJ7iDP6NhxsrYS7ZS2h10/BDzF5cTYrCvg=;
 b=AQXfA2se0wOEBJrX3mSTBDOfR0GP+hZc9IcsrbSzfhl9SdpixoscQ/oaP9/PsLDUdoDI
 y1RsIUYYepnTI7VMyi2QPSEUvUhUT+o6RjyXE/HQCs8hTG8p7fAdwFVFWgv/R2xFdAxB
 g/M6PMmLoHg4wRLtSwWzOZhQeEYEllzwNESMMX6PKIa9wnUjuj2GCNKc7dckARfvrmrD
 otsxur7O5PzExYyQ+Ecn74+6KgImKO1wIkPBUpVGwiVkSviCnEQLF/AeX7k1IgQTs3gv
 OWlVjbkayj7ols18QzGYM4oxmreq0rC32c2wqB+vZ4TVKwVudSxvOU37FQsRTovhdgGL GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gevu4pq6f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Jun 2022 17:54:07 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252H9KVc003811;
        Thu, 2 Jun 2022 17:54:07 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gevu4pq6b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Jun 2022 17:54:07 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252Ho3YB012965;
        Thu, 2 Jun 2022 17:54:06 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma02wdc.us.ibm.com with ESMTP id 3gbc93431x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Jun 2022 17:54:06 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 252Hs58f28180898
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 2 Jun 2022 17:54:05 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B3F4AC605A;
        Thu,  2 Jun 2022 17:54:05 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 937A3C6059;
        Thu,  2 Jun 2022 17:54:05 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu,  2 Jun 2022 17:54:05 +0000 (GMT)
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux@roeck-us.net, tzungbi@kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, aik@ozlabs.ru, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] pseries-wdt: initial support for H_WATCHDOG-based watchdog timers
Date:   Thu,  2 Jun 2022 12:53:49 -0500
Message-Id: <20220602175353.68942-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: t7RTpSfJ-J27zp-xtXlycfpzS_l9hs9b
X-Proofpoint-GUID: hHBHgXDHIUOzUDb0-w-QkgG5wpWMryyK
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_05,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206020073
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PAPR v2.12 defines a new hypercall, H_WATCHDOG.  This patch series
adds support for this hypercall to powerpc/pseries kernels and
introduces a new watchdog driver, "pseries-wdt", for the virtual
timers exposed by the hypercall.

This series is preceded by the following:

RFC v1: https://lore.kernel.org/linux-watchdog/20220413165104.179144-1-cheloha@linux.ibm.com/
RFC v2: https://lore.kernel.org/linux-watchdog/20220509174357.5448-1-cheloha@linux.ibm.com/
PATCH v1: https://lore.kernel.org/linux-watchdog/20220520183552.33426-1-cheloha@linux.ibm.com/

Changes of note from PATCH v1:

- Trim down the large comment documenting the H_WATCHDOG hypercall.
  The comment is likely to rot, so remove anything we aren't using
  and anything overly obvious.

- Remove any preprocessor definitions not actually used in the module
  right now.  If we want to use other features offered by the hypercall
  we can add them in later.  They're just clutter until then.

- Simplify the "action" module parameter.  The value is now an index
  into an array of possible timeoutAction values.  This design removes
  the need for the custom get/set methods used in PATCH v1.

  Now we merely need to check that the "action" value is a valid
  index during pseries_wdt_probe().  Easy.

- Make the timeoutAction a member of pseries_wdt, "action".  This
  eliminates the use of a global variable during pseries_wdt_start().

- Use watchdog_init_timeout() idiomatically.  Check its return value
  and error out of pseries_wdt_probe() if it fails.


