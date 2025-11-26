Return-Path: <linux-watchdog+bounces-4637-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0F5C8A6C1
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Nov 2025 15:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBC373ABDE9
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Nov 2025 14:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5593043C4;
	Wed, 26 Nov 2025 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Gg0D9OU9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77461305040
	for <linux-watchdog@vger.kernel.org>; Wed, 26 Nov 2025 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168211; cv=none; b=sH/I/FLwOo1z0kNOnCzkOuMT6TXuChz8aOqAO8WlvnpeX9Z6HCzKmwdeL8VPNJEldufbxUM72JZb0d8rBeU7o9/4igt6GtRbD/lLfQfr67JgrP0Z3TaHmUUDSlZOBuuYmD20zNbA9zE0Y1y+aLKEjhc/JwWNigueauH3OokFhrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168211; c=relaxed/simple;
	bh=SoF6/EsbvzDiFHKb+uzZNjh354J/rxQvIscsFsMquRs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZiIhAgAuvpPijrB2oW2eqXJvDaOvogQz+Bkw3G9O2JRnbuBSBHvufACYGq0LKSw+/58lbZlX7R1iF/vjDTF9T44F2m9ALRvsT8ELwRv3IyR8/FxJnq/gfATbLJEni9o2ZJpo3BNwm8LidGN1CS0hpcbkz1w8/HSwgXBiwm+/ZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Gg0D9OU9; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AQBZ8KO009543;
	Wed, 26 Nov 2025 14:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=tiqVDL5Fs5aZcXFF+JexwkqVyUiScXbQfCTOfWsVP
	eo=; b=Gg0D9OU9+TMvdabC3J+d0uPOACXDOYFGCGS733bgt5KDfyP8ijZgCBj5O
	EZyKro2ueMOYqNfv16lrLTz2DXMwKtbNsBiHlDwX2zJhFMMcBBxtkR2Bqv0P8Rq3
	LsAbReMJRbjt4RMslIVceev+HYucXm06+xpAqV7rp8iBonGyWXRneIzYVRSWN2Wk
	E5S7ztwgaeEvwHg6B/USrxMaEy8Tv2tKfpUiUzrjm+FUbB8SfpW11GeH5ToIDy8x
	LAoAqIyHPYErv5u+nvemageFAUJuInpRE7cXkLkgNF0bmMZ2iQCHgQy/GKqoQ6lK
	FJWWxr7t42l+XhMroYuLIScl87X3A==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4u23pkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 14:43:15 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AQDph3K000882;
	Wed, 26 Nov 2025 14:43:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4akqvy34ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 14:43:14 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AQEhCKu31850996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Nov 2025 14:43:12 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7577420049;
	Wed, 26 Nov 2025 14:43:12 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5407720040;
	Wed, 26 Nov 2025 14:43:12 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Nov 2025 14:43:12 +0000 (GMT)
From: Heiko Carstens <hca@linux.ibm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: diag288_wdt: Remove KMSG_COMPONENT macro
Date: Wed, 26 Nov 2025 15:43:12 +0100
Message-ID: <20251126144312.2219492-1-hca@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAyMSBTYWx0ZWRfX0OAzvM7MHQQW
 VekiTYVwcyaiaTvQQEz80mcAyf7wlQHpKUsKCj+DN6pAKfCdQWaVo7oHngFgPOdMp6sCVjwJz1/
 +ppMuEJGfT8GleIbUNV3lYf2Oj1R0mtY2kSrryh/8sUn8kjRXwsu5aO8jrR2l8SPJawu35wgCe0
 kNkCYlCjqknwJwf6zVc3ys3aWjbd8n4nAXxTXX+pJf4e/QCXdTlaXZhsKygHLBPm/5uYq7OJc6h
 GCwAUFPKWT/k1/wugRh8qJ28O8DEHBop4Q8YBlQWhmCbnELAt3FhbKAdKau//R08tE/VIEyM6ri
 Vc8KR79xu1ZPsUsrmRvGnB/I7Sn0cGPGsOQqehT/8YxS8j9QkImMT2VGPaXdMvuIcjzFCDY19Zv
 FN17vyE+5m+tZbwrOcn+Ek5nLPeV0A==
X-Authority-Analysis: v=2.4 cv=SuidKfO0 c=1 sm=1 tr=0 ts=69271203 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=07d9gI8wAAAA:8 a=VnNF1IyMAAAA:8
 a=0MtoT9bigi_nsDc5h7sA:9 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-ORIG-GUID: BdJ96yeJ7zMZAx9PBAzlT_pZXIHTe47Z
X-Proofpoint-GUID: BdJ96yeJ7zMZAx9PBAzlT_pZXIHTe47Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511220021

The KMSG_COMPONENT macro is a leftover of the s390 specific "kernel message
catalog" from 2008 [1] which never made it upstream.

The macro was added to s390 code to allow for an out-of-tree patch which
used this to generate unique message ids. Also this out-of-tree doesn't
exist anymore.

Remove the macro in order to get rid of a pointless indirection.

[1] https://lwn.net/Articles/292650/

Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
---
 drivers/watchdog/diag288_wdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/diag288_wdt.c b/drivers/watchdog/diag288_wdt.c
index 887d5a6c155b..9daed2758ae5 100644
--- a/drivers/watchdog/diag288_wdt.c
+++ b/drivers/watchdog/diag288_wdt.c
@@ -18,8 +18,7 @@
  *
  */
 
-#define KMSG_COMPONENT "diag288_wdt"
-#define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
+#define pr_fmt(fmt) "diag288_wdt: " fmt
 
 #include <linux/init.h>
 #include <linux/kernel.h>
-- 
2.51.0


