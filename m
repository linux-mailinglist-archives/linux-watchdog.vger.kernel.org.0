Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9B75203BB
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 May 2022 19:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239767AbiEIRtD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 May 2022 13:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239768AbiEIRtC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 May 2022 13:49:02 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E763286FD4
        for <linux-watchdog@vger.kernel.org>; Mon,  9 May 2022 10:45:07 -0700 (PDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249Gph8C008667;
        Mon, 9 May 2022 17:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=YJxjIg1FgYUMn/BysGr3B5xpD5ssCfgI/VGjDQ9drmU=;
 b=J3yDz88zmE3/bibY1SnSyw2uZbeo82sfq07a4etUEKu3G+fmMYicheKgOCyhdla1nI5M
 /L1zVpAgAExXonI8nHgUn97IU+VJd7HDIi+3c43KLQskh06bL8D8E84mjT/Ct11G/mJ3
 Wq4PNfiDFNPO6HKiJS4ctKFcJAyNtfLAdbkyWJev22Vn/srV+NN/x7jRE/Qzaxs03GEA
 xcQ22oRdULjUvI9jWUtrj8swClDrrMH0PDHbVdw1XoPz3LpZZXIlTUY6QTLwrYSWDVIi
 rrGBU4PfI8Krq3wLE8NU4lViE9aFZTVPaw3QHYxlmpXPF3b5RHAyOj68rahZOON8E067 nA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fy6ud8wnq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 May 2022 17:44:51 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 249H8Ws4011177;
        Mon, 9 May 2022 17:44:50 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fy6ud8wnf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 May 2022 17:44:50 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 249Hgv23020655;
        Mon, 9 May 2022 17:44:49 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma03wdc.us.ibm.com with ESMTP id 3fwgd97rhe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 May 2022 17:44:49 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 249HiloR31261134
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 9 May 2022 17:44:47 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 786156E052;
        Mon,  9 May 2022 17:44:47 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 56B5C6E050;
        Mon,  9 May 2022 17:44:47 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
        by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon,  9 May 2022 17:44:47 +0000 (GMT)
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux@roeck-us.net, tzungbi@kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, aik@ozlabs.ru, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com
Subject: [RFC v2 0/2] Add driver for PAPR watchdog timers
Date:   Mon,  9 May 2022 12:43:55 -0500
Message-Id: <20220509174357.5448-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oMeLZEZjtktG0yMM7OdBodu1hXRf67NT
X-Proofpoint-ORIG-GUID: wD_yg6UE4KxQlkbgZaIP1WbrZgS9kuAj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_05,2022-05-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1011 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090092
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This second RFC incorporates feedback from the previous RFC:

https://lore.kernel.org/linux-watchdog/20220413165104.179144-1-cheloha@linux.ibm.com/

v2 changes of note:

- Add a firmware feature flag for the H_WATCHDOG feature,
  FW_FEATURE_WATCHDOG.

- Register a platform_device for the first watchdog timer during a
  pseries initcall if we have FW_FEATURE_WATCHDOG.  Use id zero, as
  there could be more than one timer in the future.

- Alphabetize Makefile changes.

- Add missing copyright information to pseries-wdt.c.

- Add an 'action' module parameter that configures how the guest is
  terminated on watchdog expiration.

- Use dev_*() for logging critical errors instead of pr_*().

- Handle the H_NOOP case when trying to stop the watchdog.  If the 
  given watchdog is not actually running, H_WATCHDOG returns H_NOOP.
  This is harmless, so we should treat it as a success.

- We don't need pseries_wdt_remove() at all.

- Check watchdog_active() before stopping/starting the timer across
  suspend/resume.

- Consolidate all code from pseries_wdt_module_init() into
  pseries_wdt_probe().  We can then use module_platform_driver().

I have one lingering question:

- The pseries-wdt module is not "automatically" loaded during boot.

  When I do

	# modprobe pseries-wdt

  the driver attaches to the platform bus as expected and the
  /dev/watchdog* devices for the pseries-wdt.0 platform device
  are created.

  I was under the impression that driver/device matching for
  the platform bus was simple string comparison.

  ... what am I doing wrong?  Is this expected behavior?  Do
  I need to do additional configuration to get the module to
  load automatically at boot time?

