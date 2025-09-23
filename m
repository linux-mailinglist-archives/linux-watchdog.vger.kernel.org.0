Return-Path: <linux-watchdog+bounces-4267-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C8FB97465
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Sep 2025 21:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 057224C6C82
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Sep 2025 19:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C272DECBA;
	Tue, 23 Sep 2025 19:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="eVY6MhV1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2606F30274D;
	Tue, 23 Sep 2025 19:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758654247; cv=none; b=L6LCkZLywb/G0BJn0BtXoUAiYep1B7F+KDsVdKz4PKQ2N45D7yknZMx8tWOnCAdX+xK2aA+6qbi0+aTGZl4ZuQfMyx1hVyBxdaARjFUSXReRFe7ohQXnM7fASlPmJcPjeR9RsRuJGvau+mAvDSVURnR6rNGLiAzbvkhgXV2u3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758654247; c=relaxed/simple;
	bh=iMGcfHiJFEzcrBGSC0A065gE5cSTWvePIhBxJ8aX0XI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UT721mZ2pHBy0YKCzOaUwTR9HImaZ+oCBRIDK1H1UyYQzqdJXL+FKI7Lh5JYlq0moHHvlcC2KEUT9Hb2DUF+eKG2Q0ZIvPnWHjF7YGj7sI8WIrNayAe8tgSOmh4rne27iR7MuMGYGPGaZxtUF8Cj4/0XmJhYjNRWkMvO8klaBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=eVY6MhV1; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NG3NZT011844;
	Tue, 23 Sep 2025 19:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pps0720; bh=4BwTFdkbHJSk0Q56PrE2/lJUlyGwEUPgxIQ/B
	rK7PV8=; b=eVY6MhV1+vmuFNr/GXU61mczd+I4ufr6/2+nSHfWIa6dsK8iWd1zx
	s2+IKHZP5cfqwoQ3WAr3fQ7EybskBdXnIgkhouOkt1wcwNnmy+t112yLZJiTLzRW
	6lTUxrFGUz54M79Ry6hG0KrjjAmP70f68RBfGwRYSQo8nXyc40/xlutQy7CEYMEc
	mwtIT5IZGBnEYGtCYR/MTsu8YHElQ2Utvo4UMypzDAhEI9Lahm4LYI1DfHWNujhk
	7htUETE8fXKdT3mfChklPKRpzWvuzioToS5ht+aswC4cN2D4+70sw/g59+Svx8Tv
	0TiNxUBuxSMaihYujHbOT/URtLlO6Wrvg==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 49bqvewx74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 19:04:03 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 10BB58059C2;
	Tue, 23 Sep 2025 19:03:59 +0000 (UTC)
Received: from anatevka.americas.hpqcorp.net (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id EB502810AD6;
	Tue, 23 Sep 2025 19:03:58 +0000 (UTC)
From: Jerry Hoemann <jerry.hoemann@hpe.com>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, craig.lamparter@hpe.com,
        Jerry Hoemann <jerry.hoemann@hpe.com>
Subject: [PATCH 1/1] watchdog/hpwdt New maintianer
Date: Tue, 23 Sep 2025 13:03:52 -0600
Message-ID: <20250923190352.2517220-1-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fle3bPANs2Gop6V5MtsIEBqsL3Jm31YD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDA3NSBTYWx0ZWRfX8yC5LwLcDGas
 l/nS3beP56mr6aimqO/LE97vyzSU9Nrrimdq+986DFLPEl1dhj9nNxN1VGYrwzJLQSMvvh/Kz6k
 hbpDyapstelT8VdksI8VctTbmQTi4kNjVhks4rlXaFF+bnvTGu/GQ6vN1ou4EWtLbXlgkSreZAM
 NI+IlXW1HjtwTtsxjTZErrIIqIv+3ZzKC3+rPllTdlEfonIIMNPd7Jnffk5svJuYsK9ci11BZ6b
 nmUQffk9nxVdw6feXumQtLfmQoSH9F67iM3ZAu6vt4nmA73QUhVs39oL3wnPHpkRmzO17R1/6y0
 4VK9fLhItw4w9KXgzlGP0UJlbNfIsSiOIk2rkMoD5aogJFx0oTX4D2y3nlYlBcqo0ldLJ60Cuuo
 8Gw6ytCT
X-Authority-Analysis: v=2.4 cv=Mq5S63ae c=1 sm=1 tr=0 ts=68d2ef23 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=yJojWOMRYYMA:10 a=MvuuwTCpAAAA:8 a=x2aMLugKpHOe8UzfQVUA:9
X-Proofpoint-ORIG-GUID: fle3bPANs2Gop6V5MtsIEBqsL3Jm31YD
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230075

Update MAINTAINERS file with new contact.

Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 520fb4e379a3..11839d5f1c2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10784,7 +10784,7 @@ S:	Supported
 F:	drivers/misc/hpilo.[ch]
 
 HEWLETT PACKARD ENTERPRISE ILO NMI WATCHDOG DRIVER
-M:	Jerry Hoemann <jerry.hoemann@hpe.com>
+M:	Craig Lamparter <craig.lamparter@hpe.com>
 S:	Supported
 F:	Documentation/watchdog/hpwdt.rst
 F:	drivers/watchdog/hpwdt.c
-- 
2.50.0


