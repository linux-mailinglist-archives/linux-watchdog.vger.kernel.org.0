Return-Path: <linux-watchdog+bounces-4039-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC1B31916
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 15:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BD596224E6
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 13:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695412FF15E;
	Fri, 22 Aug 2025 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omhht5mX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FEC2327A3;
	Fri, 22 Aug 2025 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868550; cv=none; b=a+y/mn3YlWIjoiYLPYF/WPlhWqXvjHwJuyVOXKCYK+nPASof8XgHOz83uN9VgVnkJydbei1tzp3P/pEXG/5JAEA2dDAmEu/Iwne6biONh/ESbLGwQBKoOD0ZuHddsl4Tv8MIrCocja0Mlw5nghNYEQvajwNXtwRFRQpWR7c3btE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868550; c=relaxed/simple;
	bh=5edwIv2wGdGR2+Ign0FEjaM0t9DIY3ags+xEJ31/G64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QSMOQKdAmOiY1gCGS87c3zB6iI17/8x7Ct0ltAFqNpGuNLifO/ZI5LU19Y0V8VmPBs6vewppb374CGgq33556/+QIoCSYNfVwMpYWyAMViUIkToY4oKntFPjN9cs1wL9cVhAYGYvkJGT0e7j2lhgtJiOuNUR1I6gluWAEfb7sak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omhht5mX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77463C113CF;
	Fri, 22 Aug 2025 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868549;
	bh=5edwIv2wGdGR2+Ign0FEjaM0t9DIY3ags+xEJ31/G64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=omhht5mX9/geLecs1wdPpTwfso24JHFSn8NH5Y1RsNLTEZFrvoinVWsb8XaAgyz/K
	 VoGZGIEocDVi6Ef9vWx8XM9V2jr0V9wc3jJji0ycuUDe3VtnLdFvUaQgLsWuiRCJlk
	 CPsQBnBgzcIQykxQoH5G/L8Vf5HUJbbFFektpSxEAjlnVYoyGl8NIWQAD3fCWt4K3+
	 5Yd+PX9CAQvIuPvJaYC6rDYED1vTCR7+HiW0932tWT/vaaPFiejqFRHs4UnaNozCsk
	 I+4Z5DljalRxr4tBLCT9vB9FCpjlArZjexNMT3sJVNucuJsTmvOU78T1mx/JKbVq+q
	 ubkxprkrhmuJg==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 1/7] dt-bindings: arm: ti: Add bindings for Kontron SMARC-sAM67 module
Date: Fri, 22 Aug 2025 15:15:25 +0200
Message-Id: <20250822131531.1366437-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for the AM67 based Kontron SMARC-sAM67
module.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index e80c653fa438..af41f1541850 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -181,6 +181,7 @@ properties:
         items:
           - enum:
               - beagle,am67a-beagley-ai
+              - kontron,sa67             # Kontron SMARC-sAM67 board
               - ti,j722s-evm
           - const: ti,j722s
 
-- 
2.39.5


