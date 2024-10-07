Return-Path: <linux-watchdog+bounces-2098-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3319924DF
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 08:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1085AB222F2
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 06:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C84D140E5F;
	Mon,  7 Oct 2024 06:34:13 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB00E42077;
	Mon,  7 Oct 2024 06:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728282853; cv=none; b=Gm7yI9LrsE+PqNJjD2p/gEjkvCW8cwiWdViVrS4zAIgeVe4V+Z9gR258dbpNU8KK8P7byC7EDgbVeVhk2TCK9Xvccee1WGXhewDLQ3B9GM/plaN1a1TXFDTBS0UDn7RF8GBU3qLdAtPPZzJq3kW7a0tX5A2Nv131A2BxJZKaYQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728282853; c=relaxed/simple;
	bh=zUKk7A3cB7N9yNCozmY6lRuTkXd1/BfX0OO5BN9mLsg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UokdgFfTkq7JhJaJkXs0ui5K+HYlOcRGtXU15yn1+rUWpGwzPJ8WxhomTxstNdzo/wEKrudAZ/pTiJaC6bKKL7sJK27YMyYZ/hv28VWm27ncJZrU8Rco6g1ItnalItXdFyfUeKRdTuKjaRjF/DnfUgN5G/+aw+ip3QVRn4vTdfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 7 Oct
 2024 14:34:08 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 7 Oct 2024 14:34:08 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
CC: <Peter.Yin@quantatw.com>, <Patrick_NC_Lin@wiwynn.com>,
	<Bonnie_Lo@wiwynn.com>, <DELPHINE_CHIU@wiwynn.com>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 0/4] [PATCH 0/4] Update ASPEED WDT bootstatus
Date: Mon, 7 Oct 2024 14:34:04 +0800
Message-ID: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
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
Moreover, WDT SW reset is supported since AST2600 platform
and is also included in this patch series.

Chin-Ting Kuo (4):
  dt-bindings: watchdog: aspeed: Add property for WDT SW reset
  ARM: dts: aspeed: Add WDT controller into alias field
  watchdog: aspeed: Update bootstatus handling
  watchdog: aspeed: Add support for SW restart

 .../bindings/watchdog/aspeed,ast2400-wdt.yaml |  11 ++
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi       |   2 +
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi       |   3 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   4 +
 drivers/watchdog/aspeed_wdt.c                 | 149 ++++++++++++++++--
 5 files changed, 160 insertions(+), 9 deletions(-)

-- 
2.34.1


