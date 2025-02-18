Return-Path: <linux-watchdog+bounces-2955-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFC7A39142
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 04:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A88F7A3DF4
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 03:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3621215E5C2;
	Tue, 18 Feb 2025 03:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="mPNYOxDI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B260A155753;
	Tue, 18 Feb 2025 03:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739848676; cv=none; b=TplOHRXiOlabiJOmo8F4m+i5kBXW7q7HbX5F1rNztYLJxt5h7Xcu5S+yuMckXMdJW18bJK73dooOrHsdutLi2HoAOvU4ozXhNn7d7u00ZWiwOVoHQmOIFqkgZ3fw6US9OOYt2bqHXr6WsDzIHDGrmrLkTmuDFfX1UjszrzBJHcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739848676; c=relaxed/simple;
	bh=i0mcyA/psOENHr4FwscNmeu4Dzf11VVAzwN3AbAihK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOO/gIaaQBaQ5NnetElFNeS0ODVnoyyDGaEDG2GvCn9rhzMZikGilZ3v0qFpiGrhFDmJ3D6Kh/lyWXrQTQ8VghHA2CMktwwK66xj4iJxCzUlhEFh0IWR9E12qtJFZTSbPymDG+iyU8s/pT4ucPuC+B9ylbejvPzx7Cpv09L1NJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=mPNYOxDI; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739848670; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=qcI8nIfaXpTXXB2w65+9gPwAA9jaOdswF4r0vXF6+pw=;
	b=mPNYOxDIJrukUsRl/ewnCfuJ85DAp9aUL9HhYMZLOpEPvmX4Pnwl8efBZTaWTLYV/zdKxwCJk3VKJ1a4wEKWJKJhnTie/gu/qrqJlYmqSpW/uSTrJ6wxcQcJAT1Jgi1VziI4Xjlxo6s7prxvuNpoTDH70CZph23MP+NdoJrf9Gk=
Received: from 03382176d5c3.tbsite.net(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPk8Nyz_1739848648 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Feb 2025 11:17:49 +0800
From: Heyi Guo <guoheyi@linux.alibaba.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Heyi Guo <guoheyi@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH 2/2] ARM: dts: aspeed: aspeed-g6.dtsi: enable IRQ for watchdogs
Date: Tue, 18 Feb 2025 11:16:59 +0800
Message-ID: <20250218031709.103823-2-guoheyi@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To finally enable watchdog pretimeout function.

Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 8ed715bd53aa..ef7ced285c44 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -538,23 +538,27 @@ uart5: serial@1e784000 {
 			wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785000 0x40>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
 			wdt2: watchdog@1e785040 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785040 0x40>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			wdt3: watchdog@1e785080 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785080 0x40>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			wdt4: watchdog@1e7850c0 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e7850C0 0x40>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
-- 
2.43.0


