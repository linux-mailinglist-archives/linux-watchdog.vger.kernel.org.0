Return-Path: <linux-watchdog+bounces-3046-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6F3A4FB63
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Mar 2025 11:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF941169304
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Mar 2025 10:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620E32063D2;
	Wed,  5 Mar 2025 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="W8ld+Ol0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B8204C35;
	Wed,  5 Mar 2025 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169508; cv=none; b=IAeAKR8J3o8yOZUZd/BwSkYB+4y57+C4DBmhefRh18HoVGOF7AoFrGVP1ZYUt9+rbj/MbTXdSHeYvsfoov35c4+/fwt9zLHSwDQPkWz1dIFxNkY4+aJnl9Mnltbyl9umGu5YkmJ/KJv9eemJT/6qg06MCaH1y0QFXQ6AdhvOp0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169508; c=relaxed/simple;
	bh=30rEyG+pIJxPNakYv5p7IGH7V2SxGpqIbqxG9RIgGU4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MzOjqms7qAfTb9nloJyEOEBMXNptvmtBQX1Ug5mwOpqZscgXk93mk4SAaplFgO2arcQP675EhMD2ndt24ClTS1j09iD+4KwnfoOvs/eroN4tIK5wRfQ2rnRL9o1tF4gFaQChiweAaWlX7YHW2CkBR4mKruh6pZhzZG14K3yFeSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=W8ld+Ol0; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5258qqsZ019244;
	Wed, 5 Mar 2025 02:10:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=qbqF48qVGJ7k977FyHARI9U
	rv+TEi3KnHj8UcH7vyaU=; b=W8ld+Ol0lHAzikVYU52DOPnFV7VVZgfOtqPH0jJ
	VaMQnIcC1KqcbpBxK0AJrqnZIfA7kp5JmtRAMDtrxPbofa3ohLjhuhaGeIDQV7qj
	eaivNu7zId34ZTotRMa0qGJ5TL5NbOPjewooyqQWLOezzRjZsAe5Y2SI6yQRXSd9
	SxUkPw0D8uEmxrBVJD6DWrZiSSGGNtKSpovRv41muoRNt2PA7hGD6R0Fs8c6/l8v
	WsZn4iiU6EyK6RmfGhTCZx35/VxR0Q2u5q7TXZ3CNzitlD3fqXHsSj0hJD3TA2Zb
	453lgjgyf+3tsZGmbYzHE03WqBXMqOgWz1QybM5PE2L3o8A==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 456kg184rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 02:10:36 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 5 Mar 2025 02:10:35 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 5 Mar 2025 02:10:35 -0800
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 35B843F703F;
	Wed,  5 Mar 2025 02:10:35 -0800 (PST)
From: George Cherian <george.cherian@marvell.com>
To: <linux@roeck-us.net>, <wim@linux-watchdog.org>, <jwerner@chromium.org>,
        <evanbenn@chromium.org>, <kabel@kernel.org>, <krzk@kernel.org>,
        <mazziesaccount@gmail.com>, <thomas.richard@bootlin.com>,
        <lma@chromium.org>, <bleung@chromium.org>,
        <support.opensource@diasemi.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andy@kernel.org>, <paul@crapouillou.net>,
        <alexander.usyskin@intel.com>, <andreas.werner@men.de>,
        <daniel@thingy.jp>, <romain.perier@gmail.com>,
        <avifishman70@gmail.com>, <tmaimon77@gmail.com>,
        <tali.perry1@gmail.com>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
        <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
        <naveen@kernel.org>, <mwalle@kernel.org>, <xingyu.wu@starfivetech.com>,
        <ziv.xu@starfivetech.com>, <hayashi.kunihiko@socionext.com>,
        <mhiramat@kernel.org>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>, <imx@lists.linux.dev>,
        <linux-mips@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linuxppc-dev@lists.ozlabs.org>, <patches@opensource.cirrus.com>,
        George Cherian <george.cherian@marvell.com>
Subject: [PATCH v4 0/2] Add stop_on_panic support for watchdog 
Date: Wed, 5 Mar 2025 10:10:23 +0000
Message-ID: <20250305101025.2279951-1-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: w2sqtc8AAqn1lQeUebd10xLXrXXuTShg
X-Proofpoint-GUID: w2sqtc8AAqn1lQeUebd10xLXrXXuTShg
X-Authority-Analysis: v=2.4 cv=E7k3pbdl c=1 sm=1 tr=0 ts=67c8231c cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=Vs1iUdzkB0EA:10 a=lsmenjMKv-2rqCzf5cEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01

This series adds a new kernel command line option to watchdog core to
stop the watchdog on panic. This is useul in certain systems which prevents
successful loading of kdump kernel due to watchdog reset.

Some of the watchdog drivers stop function could sleep. For such
drivers the stop_on_panic is not valid as the notifier callback happens
in atomic context. Introduce WDIOF_STOP_MAYSLEEP flag to watchdog_info
options to indicate whether the stop function would sleep.


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

George Cherian (2):
  watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
  drivers: watchdog: Add support for panic notifier callback

 drivers/watchdog/advantech_ec_wdt.c |  3 ++-
 drivers/watchdog/arm_smc_wdt.c      |  3 ++-
 drivers/watchdog/armada_37xx_wdt.c  |  2 +-
 drivers/watchdog/asm9260_wdt.c      |  2 +-
 drivers/watchdog/bcm47xx_wdt.c      |  3 ++-
 drivers/watchdog/bd9576_wdt.c       |  2 +-
 drivers/watchdog/bd96801_wdt.c      |  2 +-
 drivers/watchdog/cgbc_wdt.c         |  2 +-
 drivers/watchdog/cros_ec_wdt.c      |  5 ++++-
 drivers/watchdog/da9052_wdt.c       |  3 ++-
 drivers/watchdog/da9055_wdt.c       |  4 +++-
 drivers/watchdog/da9062_wdt.c       |  4 +++-
 drivers/watchdog/da9063_wdt.c       |  4 +++-
 drivers/watchdog/db8500_wdt.c       |  5 ++++-
 drivers/watchdog/dw_wdt.c           |  5 +++--
 drivers/watchdog/f71808e_wdt.c      |  3 ++-
 drivers/watchdog/gpio_wdt.c         |  2 +-
 drivers/watchdog/i6300esb.c         |  5 ++++-
 drivers/watchdog/imx_sc_wdt.c       |  2 +-
 drivers/watchdog/intel-mid_wdt.c    |  5 ++++-
 drivers/watchdog/it87_wdt.c         |  5 ++++-
 drivers/watchdog/jz4740_wdt.c       |  5 ++++-
 drivers/watchdog/kempld_wdt.c       |  3 ++-
 drivers/watchdog/lenovo_se10_wdt.c  |  5 ++++-
 drivers/watchdog/max77620_wdt.c     |  5 ++++-
 drivers/watchdog/mei_wdt.c          |  3 ++-
 drivers/watchdog/menf21bmc_wdt.c    |  4 +++-
 drivers/watchdog/mlx_wdt.c          |  2 +-
 drivers/watchdog/msc313e_wdt.c      |  5 ++++-
 drivers/watchdog/npcm_wdt.c         |  3 ++-
 drivers/watchdog/omap_wdt.c         |  5 ++++-
 drivers/watchdog/pm8916_wdt.c       |  5 +++--
 drivers/watchdog/pseries-wdt.c      |  2 +-
 drivers/watchdog/rave-sp-wdt.c      |  5 ++++-
 drivers/watchdog/renesas_wdt.c      |  7 ++++--
 drivers/watchdog/retu_wdt.c         |  5 ++++-
 drivers/watchdog/rn5t618_wdt.c      |  6 +++--
 drivers/watchdog/rzg2l_wdt.c        |  5 ++++-
 drivers/watchdog/rzv2h_wdt.c        |  5 ++++-
 drivers/watchdog/shwdt.c            |  6 +++--
 drivers/watchdog/sl28cpld_wdt.c     |  5 ++++-
 drivers/watchdog/softdog.c          |  5 ++++-
 drivers/watchdog/sp805_wdt.c        |  5 ++++-
 drivers/watchdog/starfive-wdt.c     |  3 ++-
 drivers/watchdog/stpmic1_wdt.c      |  5 ++++-
 drivers/watchdog/ts4800_wdt.c       |  5 ++++-
 drivers/watchdog/twl4030_wdt.c      |  5 ++++-
 drivers/watchdog/uniphier_wdt.c     |  3 ++-
 drivers/watchdog/w83627hf_wdt.c     |  5 ++++-
 drivers/watchdog/watchdog_core.c    | 35 +++++++++++++++++++++++++++++
 drivers/watchdog/wm831x_wdt.c       |  5 ++++-
 drivers/watchdog/wm8350_wdt.c       |  5 ++++-
 drivers/watchdog/xen_wdt.c          |  5 ++++-
 drivers/watchdog/ziirave_wdt.c      |  5 ++++-
 include/linux/watchdog.h            |  2 ++
 include/uapi/linux/watchdog.h       |  1 +
 56 files changed, 198 insertions(+), 58 deletions(-)

-- 
2.34.1


