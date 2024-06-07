Return-Path: <linux-watchdog+bounces-1112-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A21F900BB4
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 20:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C718283D24
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 18:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9066197A97;
	Fri,  7 Jun 2024 18:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kbkb/yRk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A6417582;
	Fri,  7 Jun 2024 18:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717783505; cv=none; b=U5WtIT9IMs62c+0h4MQpblzxQBWZQofiED+Q8CCuuEmqFpmXH7K/Jw5/w9LEyPcOceTepJoE13j44CsCM/XMMv8v/y96TVUbrsmDUjQSw7HVvixKZOfoLS6RjzCFRAe3yFd2gAgyNy0lxAxHtD1NVtbyz4ejvCfzwp3Wyw4PEEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717783505; c=relaxed/simple;
	bh=QERQ/4hLMbGS0Y3kWZiJAbgV8efCp/OW+am7ixwBny8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=E3QkRW5m5vLB2zImjjkJSBaBbbIl2LZcWvhLrw782Fo3rR0NgWDQXB5rgatn2d46/NqsgbG/Y/V4UcfzKFC2O2unQVAFzWovFlPSSXYEemX7gSi8Phok6SNfWGO6DSq6o3AgQYD2bXhGB4B87FesVoQVX6sIF88MjKXjtZvUqrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kbkb/yRk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457HZXWp001309;
	Fri, 7 Jun 2024 18:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=898bf9MlOZb7l0W+LIWVdf
	B4dr99OYG2aJIrRxbb+BY=; b=kbkb/yRkX5yQE+ztpdxvw/LWwVrEuNkUea3szU
	jwWXLC1At3vgEsOvPt0ZxnpjXJilqXVQ2DgPl0a910MBBb/2p+3HHUa4IfFNc+Vv
	3zHZZTkRtHHYCYfFearlQEHzxqdN59onxn0DkFSWJfBfeixDlhAPIyqS9K8q5xJk
	4FfWZd/mGT2QYjMIiVgiWZcd3L/QdWCRPq8DU07ENzxjUMcsBwv9PbdzwgGtusDw
	ce9kQl9x6tQxgxDqXcE6jAz8WGvA4Xn4P66KmkVZiQauUU/lAVzKa4YwxF72qUGG
	HU920TJBEL+3zw895I7zbpdVXqfnimWh8+JMWoR2TAaRpCSA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjq2tpp5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 18:04:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457I4g4j003257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 18:04:42 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 11:04:41 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 7 Jun 2024 11:04:40 -0700
Subject: [PATCH] watchdog: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240607-md-drivers-watchdog-v1-1-485c1c58301f@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALdLY2YC/x3MwQrCMAyA4VcZORvoqlj0VcRD2sY14DpJ5hyMv
 bvV43f4/w2MVdjg2m2gvIjJVBv6QwepUB0YJTeDd/7kzi7gmDGrLKyGH5pTydOA4dIfPYWUXHT
 QypfyQ9b/9XZvjmSMUamm8ns9pb5XHMlmVtj3LweXa4+EAAAA
To: Johannes Thumshirn <jth@kernel.org>,
        Wim Van Sebroeck
	<wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Gerd Haeussler
	<gerd.haeussler.ext@siemens.com>,
        Xing Tong Wu <xingtong.wu@siemens.com>,
        Tobias Schaffner <tobias.schaffner@siemens.com>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sgguRbeA-_y-jEwe_Y83JBgt0iAj1LY-
X-Proofpoint-ORIG-GUID: sgguRbeA-_y-jEwe_Y83JBgt0iAj1LY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_10,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1011 spamscore=0 malwarescore=0
 mlxlogscore=892 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070133

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/omap_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/twl4030_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/ts4800_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/simatic-ipc-wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/menz69_wdt.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/watchdog/menz69_wdt.c      | 1 +
 drivers/watchdog/omap_wdt.c        | 1 +
 drivers/watchdog/simatic-ipc-wdt.c | 1 +
 drivers/watchdog/ts4800_wdt.c      | 1 +
 drivers/watchdog/twl4030_wdt.c     | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/watchdog/menz69_wdt.c b/drivers/watchdog/menz69_wdt.c
index c7de30270043..0508a65acfa6 100644
--- a/drivers/watchdog/menz69_wdt.c
+++ b/drivers/watchdog/menz69_wdt.c
@@ -161,6 +161,7 @@ static struct mcb_driver men_z069_driver = {
 module_mcb_driver(men_z069_driver);
 
 MODULE_AUTHOR("Johannes Thumshirn <jth@kernel.org>");
+MODULE_DESCRIPTION("Watchdog driver for the MEN z069 IP-Core");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("mcb:16z069");
 MODULE_IMPORT_NS(MCB);
diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index a7a12f2fe9de..b6e0236509bb 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -370,5 +370,6 @@ static struct platform_driver omap_wdt_driver = {
 module_platform_driver(omap_wdt_driver);
 
 MODULE_AUTHOR("George G. Davis");
+MODULE_DESCRIPTION("Driver for the TI OMAP 16xx/24xx/34xx 32KHz (non-secure) watchdog");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:omap_wdt");
diff --git a/drivers/watchdog/simatic-ipc-wdt.c b/drivers/watchdog/simatic-ipc-wdt.c
index cdc1a2e15180..1e91f0a560ff 100644
--- a/drivers/watchdog/simatic-ipc-wdt.c
+++ b/drivers/watchdog/simatic-ipc-wdt.c
@@ -227,6 +227,7 @@ static struct platform_driver simatic_ipc_wdt_driver = {
 
 module_platform_driver(simatic_ipc_wdt_driver);
 
+MODULE_DESCRIPTION("Siemens SIMATIC IPC driver for Watchdogs");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" KBUILD_MODNAME);
 MODULE_AUTHOR("Gerd Haeussler <gerd.haeussler.ext@siemens.com>");
diff --git a/drivers/watchdog/ts4800_wdt.c b/drivers/watchdog/ts4800_wdt.c
index 0099403f4992..24b1ad52102e 100644
--- a/drivers/watchdog/ts4800_wdt.c
+++ b/drivers/watchdog/ts4800_wdt.c
@@ -200,5 +200,6 @@ static struct platform_driver ts4800_wdt_driver = {
 module_platform_driver(ts4800_wdt_driver);
 
 MODULE_AUTHOR("Damien Riegel <damien.riegel@savoirfairelinux.com>");
+MODULE_DESCRIPTION("Watchdog driver for TS-4800 based boards");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:ts4800_wdt");
diff --git a/drivers/watchdog/twl4030_wdt.c b/drivers/watchdog/twl4030_wdt.c
index 09d17e20f4a7..8c80d04811e4 100644
--- a/drivers/watchdog/twl4030_wdt.c
+++ b/drivers/watchdog/twl4030_wdt.c
@@ -118,6 +118,7 @@ static struct platform_driver twl4030_wdt_driver = {
 module_platform_driver(twl4030_wdt_driver);
 
 MODULE_AUTHOR("Nokia Corporation");
+MODULE_DESCRIPTION("TWL4030 Watchdog");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:twl4030_wdt");
 

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240607-md-drivers-watchdog-79132a7cc0b0


