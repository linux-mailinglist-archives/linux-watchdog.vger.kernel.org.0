Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA1DF4FFBC1
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Apr 2022 18:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235553AbiDMQxp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Apr 2022 12:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiDMQxo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Apr 2022 12:53:44 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18D549C8F
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Apr 2022 09:51:22 -0700 (PDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23DF16da018900;
        Wed, 13 Apr 2022 16:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=b63lsgM8X9+SR0t6sdgBhEMq5ZiJTLb/GBY5n34qV/0=;
 b=ITdqXH3sSDZoj0DSaON9NdRESZi7sRY/+MVxQIuxbsXNYsMneckgyuwEC1biaam1DW5E
 hm5F98bOtk+ooblAmUCiKE+S+4ywiOV6vZ+UlIc4KPs5DhVuj6E2Ct+HIaazOmATiSIj
 Hv8tm5nTgTJ4+MvYqFkUX/aUbNRHPzDRF8ZsWLBYJmXestsTaH2FbaqLRKO4WdE9iZaI
 S4J8fKbS9cdtx1vdRNCgCPstVap/zaHVSplvIbi+kRrjfU9tVzy/hLmas0XGl68CrIte
 YvXk5DvmEOeYIjVNiTTXzVMooX7V8xcWCb4pkE8leJjXYGfgL+EetWdBdfayVnKrG4YZ 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3fe0sj2q5u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Apr 2022 16:51:21 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23DFKG1R003490;
        Wed, 13 Apr 2022 16:51:20 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3fe0sj2q5k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Apr 2022 16:51:20 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23DGS9QS009485;
        Wed, 13 Apr 2022 16:51:20 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma02dal.us.ibm.com with ESMTP id 3fb1sa1p50-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Apr 2022 16:51:20 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 23DGpHo239715170
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Apr 2022 16:51:17 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 499E76E053;
        Wed, 13 Apr 2022 16:51:17 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 210EE6E050;
        Wed, 13 Apr 2022 16:51:17 +0000 (GMT)
Received: from localhost (unknown [9.41.178.250])
        by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 13 Apr 2022 16:51:17 +0000 (GMT)
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     linux-watchdog@vger.kernel.org
Cc:     bjking@linux.ibm.com, nathanl@linux.ibm.com, aik@ozlabs.ru,
        npiggin@gmail.com, vaishnavi@linux.ibm.com, wvoigt@us.ibm.com
Subject: [RFC v1 0/2] Add driver for PAPR watchdog timers
Date:   Wed, 13 Apr 2022 11:51:02 -0500
Message-Id: <20220413165104.179144-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I6LM4JZDQDR0SKAgsgQa8VFk6fI7Guyi
X-Proofpoint-ORIG-GUID: NUr25bRj85MlNfbrXewXtRbmCK1N6ZJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_03,2022-04-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130084
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This series adds a driver for PAPR hypercall-based watchdog timers,
tentatively named "pseries-wdt".

I wanted to get some clarification on a few things before submitting
the series as a patch, hence the RFC.  The first patch adding the
hypercall to hvcall.h is straightforward, but I have questions about
the second patch (the driver).  In particular:

- In pseries_wdt_probe() we register the watchdog device with
  devm_watchdog_register_device().  However, in pseries_wdt_remove(),
  calling watchdog_unregister_devce() causes a kernel panic later,
  so I assume this is the wrong thing to do.

  Do we need to do anything to clean up the watchdog device during
  pseries_wdt_remove()?  Or does devm_watchdog_register_device()
  ensure the cleanup is handled transparently?

- In pseries_wdt_probe(), is it incorrect to devm_kfree() my
  allocation in the event that devm_watchdog_register_device()
  fails?

- The enormous hypercall input/output comment is mostly for my
  edification.  It seems like the sort of thing that will rot over time.
  I intend to remove most of it.  However, as far as I know the PAPR
  revision containing these details is not published yet.  Should I
  leave the comment in to ease review for now and remove it later?
  Or should I omit it from the initial commit entirely?

- Should we print something to the console when probing/removing the
  watchdog0 device or is that just noise?

  Most drivers (as distinct from devices) seem to print something
  during initialization, so that's what I've done in
  pseries_wdt_module_init() when the capability query succeeds.

- The timeout action is currently hardcoded to a hard reset.  This
  could be made configurable through a module parameter.  I intend
  to do this in a later patch unless someone needs it included
  in the initial patch.

- We set EIO if the hypercall fails in pseries_wdt_start() or
  pseries_wdt_stop().  There is nothing userspace can do if this
  happens.  All hypercall failures in these contexts are unexpected.

  Given all of that, is there is a more appropriate errno than EIO?

- The H_WATCHDOG spec indicates that H_BUSY is possible.  Is it
  probable, though?  Should we spin and retry the hypercall in
  the event that we see it?  Or is that pointless?


