Return-Path: <linux-watchdog+bounces-2345-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 524A79B233B
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 03:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F19A51F21074
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 02:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E1E15E5B8;
	Mon, 28 Oct 2024 02:53:26 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44536178CC5;
	Mon, 28 Oct 2024 02:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730084006; cv=none; b=ZQq4/uD2NAEH6aqkYxHNziTArqUWRWoa92MvlkHpwsxe/8ejEL6sExN0qDyKfG9MTj9VQAR7w0Wxvb++G0aALsqBTQCKGaWyhJ5aKqDr2cXMxfn53qihA8cAt1ppOuUDTLHwAL3c+GtcJwMVOslXuFG3eM1xg8aK/YxPueNz4vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730084006; c=relaxed/simple;
	bh=sGQwjD3GX4YmblAvOXlK4si5vdJtuyYa8WaS4Sxx58I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YIdOxQ3IXnwi3tyGkqXXYFnt6AHjnjwyNNn4bMHaJMgPTgLrJVyTE6P8K0KmyfkPMGWePAytzwVD6jqfJ1IHVoWAyUXwuQ9eikhg4EM/xfdYhv2x0PGfu87MPhjcNCcvu8WUul7R2anXC3aVI1L2Ls8D96Xk0AcKMXfoo2u8dyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 28 Oct
 2024 10:48:13 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 28 Oct 2024 10:48:13 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
CC: <Peter.Yin@quantatw.com>, <Patrick_NC_Lin@wiwynn.com>,
	<Bonnie_Lo@wiwynn.com>, <DELPHINE_CHIU@wiwynn.com>, <bmc-sw@aspeedtech.com>,
	<chnguyen@amperecomputing.com>
Subject: [PATCH v2 0/3] Update ASPEED WDT bootstatus
Date: Mon, 28 Oct 2024 10:48:10 +0800
Message-ID: <20241028024813.2416962-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series inherits the patch submitted by Peter.
https://patchwork.kernel.org/project/linux-watchdog/patch/20240430143114.1323686-2-peteryin.openbmc@gmail.com/
Besides, the boot status modififed in the WDT driver
obeys the rules proposed in the OpenBMC.
https://github.com/openbmc/docs/blob/master/designs/bmc-reboot-cause-update.md#proposed-design
Moreover, WDT SW restart mechanism is supported by HW
since AST2600 platform and is also included in this
patch series.

Changes in v2:
  - Support SW restart on AST2600 by default without
    adding any dts property.


Chin-Ting Kuo (3):
  ARM: dts: aspeed: Add WDT controller into alias field
  watchdog: aspeed: Update bootstatus handling
  watchdog: aspeed: Add support for SW restart

 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi |   2 +
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi |   3 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi |   4 +
 drivers/watchdog/aspeed_wdt.c           | 149 ++++++++++++++++++++++--
 4 files changed, 150 insertions(+), 8 deletions(-)

-- 
2.34.1


