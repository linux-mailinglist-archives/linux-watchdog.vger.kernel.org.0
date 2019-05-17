Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA58821F4C
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 May 2019 23:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbfEQVCj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 May 2019 17:02:39 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:44420 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729415AbfEQVCj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 May 2019 17:02:39 -0400
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4HL12BX014120;
        Fri, 17 May 2019 21:02:09 GMT
Received: from g2t2353.austin.hpe.com (g2t2353.austin.hpe.com [15.233.44.26])
        by mx0b-002e3701.pphosted.com with ESMTP id 2sj1h3s65v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 May 2019 21:02:09 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net [16.196.225.135])
        by g2t2353.austin.hpe.com (Postfix) with ESMTP id 338E377;
        Fri, 17 May 2019 21:02:08 +0000 (UTC)
Received: from lxbuild.ftc.rdlabs.hpecorp.net (lxbuild.ftc.rdlabs.hpecorp.net [16.78.34.175])
        by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id DA3D946;
        Fri, 17 May 2019 21:02:07 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mironov.ivan@gmail.com,
        rasmus.villemoes@prevas.dk, jerry.hoemann@hpe.com
Subject: [PATCH 5/6] watchdog/hpwdt: Update documentation
Date:   Fri, 17 May 2019 14:59:42 -0600
Message-Id: <1558126783-4877-6-git-send-email-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
References: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-17_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=787 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170125
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Update documentation to explain new module parameter kdumptimeout.

Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>
---
 Documentation/watchdog/hpwdt.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/watchdog/hpwdt.txt b/Documentation/watchdog/hpwdt.txt
index 55df692..35da141 100644
--- a/Documentation/watchdog/hpwdt.txt
+++ b/Documentation/watchdog/hpwdt.txt
@@ -33,6 +33,10 @@ Last reviewed: 08/20/2018
                Default value is set when compiling the kernel. If it is set
                to "Y", then there is no way of disabling the watchdog once
                it has been started.
+ kdumptimeout  Minimum timeout in seconds to apply upon receipt of an NMI
+               before calling panic. (-1) disables the watchdog.  When value
+               is > 0, the timer is reprogrammed with the greater of
+               value or current timeout value.
 
  NOTE: More information about watchdog drivers in general, including the ioctl
        interface to /dev/watchdog can be found in
-- 
1.8.3.1

