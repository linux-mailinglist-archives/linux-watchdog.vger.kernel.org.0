Return-Path: <linux-watchdog+bounces-3244-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFB5A81C2B
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Apr 2025 07:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA1C426D50
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Apr 2025 05:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE261DB124;
	Wed,  9 Apr 2025 05:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="NOBwhao5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02271DB122;
	Wed,  9 Apr 2025 05:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744176921; cv=none; b=i+Mk4ZBi8mHaioK5ws5m98i6pxyUmFJNk7zMH8qy10HKjd4QR0VtVrwnBZpblTZZmYuhlcvCgmNwxUpfQQqWM+e+28FBiSXkKkaByxs6bMDlQv9y5DycrokdfsZGMMVwO0eFFMf7RjpGe6aorEp3I21Exxx5DOVPs8RTWGhl3EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744176921; c=relaxed/simple;
	bh=kPn6f5OVoMXmjB9v5cahFg/5FN5tZ2/LXTi7N789Qj4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m2Fgvy7H+BKZ/pHdWe64nQLhwaWM1rs2JDcMIq4RFf33FQM9lsXU5qVrKwvacQrHxbewNEh2KsV3p6yaII5fpEmKUzUGIOoeaIxyxHe+hjdCaikNI70wwEeZ8333WyxIzqvq8T+QdzryyJ2lupFWrN7FbJJEfP82AZMyoyytA+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=NOBwhao5; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5390lt8I009071;
	Tue, 8 Apr 2025 22:34:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=sdKdexUtu+kW9QMg27XpY6n
	DojyNHDcE+TCJCItY2h8=; b=NOBwhao5k6CzLM2PEJWForm1k8fc7uJDsPalUp+
	iGwMMfrqwaj8NBe/mNV4VYbxOGyA06EQp5QRtAn/6VAo3LQiB3h8UCkkbkcypJl+
	BnFAtguMSbaVqyF+6fCLvX17pN1cQ3i8j2w9GtIv21mCZCFzOehn8Al+Og2uW4rc
	iaUnc/fbNtYu965L+4vHsFgSDGAAImil1lSw2bid+pV6VdxcAxer91ZH89htTcog
	G9dsQn+oVu2m1I/VXCOw475zBGBHl3JIOsRR0TArsTpVRuCpyhknp9ajJo/lIRhV
	nhfWaQDs4acuZHmVNS0vWQ5Gzx2yi0+wClAY9ADiCoiVxFQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 45unnaxyc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 22:34:59 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Apr 2025 22:34:58 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 8 Apr 2025 22:34:58 -0700
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id ED6FE3F7066;
	Tue,  8 Apr 2025 22:34:57 -0700 (PDT)
From: George Cherian <george.cherian@marvell.com>
To: <linux@roeck-us.net>, <wim@linux-watchdog.org>, <a.fatoum@pengutronix.de>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "George
 Cherian" <george.cherian@marvell.com>
Subject: [PATCH v5 0/2] Add reset_on_panic support for watchdog
Date: Wed, 9 Apr 2025 05:34:50 +0000
Message-ID: <20250409053452.3173447-1-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: t8IN781_o7wur9sOrvAgqutqBQjqIGpT
X-Authority-Analysis: v=2.4 cv=E57Npbdl c=1 sm=1 tr=0 ts=67f60703 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=i_2PNuB7HiXbIVo88oEA:9
X-Proofpoint-ORIG-GUID: t8IN781_o7wur9sOrvAgqutqBQjqIGpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01

This series adds a new option to watchdog core to reconfigure the
watchdog timeout on panic. This is useul in certain systems which prevents
successful loading of kdump kernel due to watchdog reset.

Some of the watchdog drivers ops could sleep. For such drivers the 
reset_on_panic is not valid as the notifier callback happens
in atomic context. Introduce WDIOF_OPS_ATOMIC flag to watchdog_info
options to indicate whether the stop/set_timeout function would sleep.


Changelog:
v1 -> v2
- Remove the per driver flag setting option
- Take the parameter via kernel command-line parameter to watchdog_core.

v2 -> v3
- Remove the helper function watchdog_stop_on_panic() from watchdog.h.
- There are no users for this. 

v3 -> v4
- Since the panic notifier is in atomic context, watchdog functions
  which sleep can't be called. 
- Add an options flag WDIOF_STOP_MAYSLEEP to indicate whether stop
  function sleeps.
- Simplify the stop_on_panic kernel command line parsing.
- Enable the panic notiffier only if the watchdog stop function doesn't
  sleep

v4 -> v5
- Remove the kernel command line option.
- Incorporate the suggestions by Ahamad Fatoum.
- Give an option to watchdog core to set the timeout in case of panic.
- This timeout is configurable runtime via sysfs.
- This way it addresses all the watchdogs as long as they have watchdog
  ops  atomic.
- Enable this feature to sbsa watchdog.

George Cherian (2):
  drivers: watchdog: Introduce watchdog reset timeout on panic
  drivers: sbsa_gwdt: Enable the reset_on_panic feature

 drivers/watchdog/sbsa_gwdt.c     |  3 +++
 drivers/watchdog/watchdog_core.c | 33 ++++++++++++++++++++++++++++++++
 drivers/watchdog/watchdog_dev.c  | 28 +++++++++++++++++++++++++++
 include/linux/watchdog.h         |  3 +++
 include/uapi/linux/watchdog.h    |  1 +
 5 files changed, 68 insertions(+)

-- 
2.34.1


