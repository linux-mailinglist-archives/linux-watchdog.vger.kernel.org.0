Return-Path: <linux-watchdog+bounces-3433-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9230FAAB9B6
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 09:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B1FE189E640
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 06:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C97297B87;
	Tue,  6 May 2025 04:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="JXt3rZTM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-m19731110.qiye.163.com (mail-m19731110.qiye.163.com [220.197.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEBA319A5E;
	Tue,  6 May 2025 03:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746501170; cv=none; b=cuDmZ530+mrpkP9i0j2Ms/NagXF/DaJxSb/9i/rlSvT6CRULbstLyivw5PAq6oVgezAJyNuJ/iPwEIf2OF6M4N9iO3QfNRJgXYApgL94lJ0DtM+HvDaXeEzIj9B6H6koMlGzAvYZWM9bxRhO36F+SNB0flvDkfanOMRKNykwIPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746501170; c=relaxed/simple;
	bh=oW9HeIeCmokvmEUwG5AjU4lvlrfAArDaT9DBtFEWufc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S+I/KkD/t7wBT9ZmEkVqk79mnHbhyydse54TcQ7BpBmuEP4ms4ZsIr1R+k59cYBNDeEb34bP3xOcuzfAUmZIcDOVyJQ58/XRAp/SGjHcQuhZ4Jhwy/5i5jIaNKvrTszD2IZWV5Fh+C1w7t0aOcJMzfm8mWR34vR1Dft2ISWTxIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=JXt3rZTM; arc=none smtp.client-ip=220.197.31.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 140c6eae0;
	Tue, 6 May 2025 10:57:19 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Frank Wang <frank.wang@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Junhao Xie <bigfoot@classfun.cn>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Yao Zi <ziyao@disroot.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	devicetree@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	linux-watchdog@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-kernel@vger.kernel.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v5 0/6] rockchip: Add rk3562 SoC and evb support
Date: Tue,  6 May 2025 10:57:09 +0800
Message-Id: <20250506025715.33595-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxoZSFYYGhlPGktMSB1DThpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
X-HM-Tid: 0a96a386c1a103afkunm140c6eae0
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NxQ6Fio4SjJJShEtMjxMMDIe
	KS4KCjBVSlVKTE9NTktLSU9KQkpLVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIQkNKNwY+
DKIM-Signature:a=rsa-sha256;
	b=JXt3rZTMDb7HXMD+niuonbqjJO5oAH8E9/BS/AneQJR5fV0DyZvEkJj5FvNTpH8YpOqSHRatefzpH/oVzeTuTrmZ0GwEM28dHv5+b0Q8SjBCu8Di4pHtPVYu7GhLUfP1HIYTumDe32xV7t4WYRL8JK79ZaoLr28DDGYcKGofxXY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=3dqzEK6o7cHu5/0LtgezIfFhqUApVg/7ee7umICA/ho=;
	h=date:mime-version:subject:message-id:from;


Patch series V5 remove [v4 1/7] which had taken by Manivannan, and move
scmi-shmem from soc node to reserved memory.

Patch series V4 remove patches already landed, and remove dts nodes for
modules still under review.

This patch set adds rk3562 SoC and its evb support.

I have split out patches need driver change for different subsystem.
And all the modules with dt-binding document update in this patch set
do not need any driver change. I put them together to make it clear we
have a new SoC and board to use the new compatible. Please pick up the
patch for your subsystem, or please let me know if the patch has to
send separate.

Test with USB, PCIe, EMMC, SD Card.

This patch set is base on the patch set for rk3576 evb1 support.

V3:
https://lore.kernel.org/linux-rockchip/20250227111913.2344207-1-kever.yang@rock-chips.com/
V2:
https://lore.kernel.org/linux-rockchip/b4df8a73-58a2-4765-a9e4-3513cb2bc720@rock-chips.com/T/


Changes in v5:
- Collect review tag
- Update scmi-shmem from soc to reserved memory

Changes in v4:
- Collect ack tag
- Collect ack tag
- Collect ack tag
- remove gmac and otp nodes
- remove gmac nodes

Changes in v3:
- Collect reveiw tag
- Collect the Acked-by tag
- remove i2c/serial/spi alias
- add soc node

Changes in v2:
- Update in sort order
- remove grf in cru
- Update some properties order

Finley Xiao (2):
  arm64: dts: rockchip: add core dtsi for RK3562 Soc
  arm64: dts: rockchip: Add RK3562 evb2 devicetree

Kever Yang (4):
  dt-bindings: watchdog: Add rk3562 compatible
  dt-bindings: rockchip: pmu: Add rk3562 compatible
  dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
  dt-bindings: arm: rockchip: Add rk3562 evb2 board

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |    7 +
 .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  488 ++++
 .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1270 +++++++++
 8 files changed, 4126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi

-- 
2.25.1


