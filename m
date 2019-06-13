Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8E774478B
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2019 19:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbfFMRAR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Jun 2019 13:00:17 -0400
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:57010 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729777AbfFMAEP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Jun 2019 20:04:15 -0400
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5D02Sfo000308;
        Thu, 13 Jun 2019 00:03:53 GMT
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
        by mx0b-002e3701.pphosted.com with ESMTP id 2t38j1v6t5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jun 2019 00:03:52 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g9t5008.houston.hpe.com (Postfix) with ESMTP id 08A0D57;
        Thu, 13 Jun 2019 00:03:52 +0000 (UTC)
Received: from anatevka.ftc.rdlabs.hpecorp.net (anatevka.americas.hpqcorp.net [10.34.81.61])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id A9A1A5F;
        Thu, 13 Jun 2019 00:03:51 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net
Cc:     wim@linux-watchdog.org, mchehab+samsung@kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jerry Hoemann <jerry.hoemann@hpe.com>
Subject: [PATCH 1/1] docs: watchdog: Fix build error.
Date:   Wed, 12 Jun 2019 18:02:37 -0600
Message-Id: <20190613000237.377-2-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613000237.377-1-jerry.hoemann@hpe.com>
References: <20190613000237.377-1-jerry.hoemann@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-12_14:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=797 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120169
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

make htmldocs fails due to missing blank line following header.

Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>
---
 Documentation/watchdog/watchdog-parameters.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 01023382ea73..a3985cc5aeda 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -12,6 +12,7 @@ providing kernel parameters for builtin drivers versus loadable
 modules.
 
 -------------------------------------------------
+
 watchdog core:
     open_timeout:
 	Maximum time, in seconds, for which the watchdog framework will take
@@ -22,6 +23,7 @@ watchdog core:
 	fallback logic in the bootloader to try something else.
 
 -------------------------------------------------
+
 acquirewdt:
     wdt_stop:
 	Acquire WDT 'stop' io port (default 0x43)
-- 
2.20.1

