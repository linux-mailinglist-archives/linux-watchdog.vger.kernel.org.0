Return-Path: <linux-watchdog+bounces-2717-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3DDA1205A
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 11:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF5E83A306C
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 10:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7551E98E4;
	Wed, 15 Jan 2025 10:44:17 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C761E98F8;
	Wed, 15 Jan 2025 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937857; cv=none; b=Y8ZPHcpUjqar3UJOs0lWxTke3CT57rvyXhiZOIaCX5yA25Ttzg3aTRpT1OZ9mrT+m1YSpHzJfu0LABpvLln0H3M5tV8Ku56iqLj6Ms8gdZ9awCaK6fTY8g8ZNau/aK3ZJX86HEwymt2h/tc3E9XmFptwptmSY0r7u4ALFeAt2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937857; c=relaxed/simple;
	bh=YreGTaxToDhQTEYAOnwnnG5rnM3YMzUqjJ3eF3dQMAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c9TWDHdAZyRzVYgDBGC7qtiVozmaN9vqzpHFrND49Rw1VLkAB+q3JnzNmcfrMggb0KhH7y830LLcGm7tBEQjiIcDE/HM9OSC671RQY/d2xZSnxfWOVwKj7+XuANeZbKFMdSOZZlKBDuiFnxLTg59eB7PaBzM+a7cgw/WjivCOSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 7b5Glj5nSg2tW4vtWLWFtQ==
X-CSE-MsgGUID: XJL4LDtGSgSnFQRTDv51hQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Jan 2025 19:39:05 +0900
Received: from localhost.localdomain (unknown [10.226.93.251])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1E681422D9AD;
	Wed, 15 Jan 2025 19:39:00 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/5] Add support for RZ/G3E WDT
Date: Wed, 15 Jan 2025 10:38:49 +0000
Message-ID: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/G3E WDT IP is similar to RZ/V2H WDT. WDT0 can be used for CM33 cold
reset, system reset and asserting WDTUDFCM pin where as WDT1 can be used
for CA55 cold reset, system reset and asserting WDTUDFCA pin. Other 2
watchdogs can be used for system reset. So define WDT{1..3} in SoC dtsi.

Biju Das (5):
  dt-bindings: watchdog: renesas,wdt: Document RZ/G3E support
  clk: renesas: r9a09g047: Add WDT clocks/resets
  watchdog: Make RZV2HWDT driver depend on ARCH_R9A09G47
  arm64: dts: renesas: r9a09g047: Add WDT1-WDT3 nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable watchdog

 .../bindings/watchdog/renesas,wdt.yaml        |  4 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 30 +++++++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  4 +++
 drivers/clk/renesas/r9a09g047-cpg.c           | 15 ++++++++++
 drivers/watchdog/Kconfig                      |  7 +++--
 5 files changed, 57 insertions(+), 3 deletions(-)

-- 
2.43.0


