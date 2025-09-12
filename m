Return-Path: <linux-watchdog+bounces-4238-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25857B54D28
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 14:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 479B93ACC89
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 12:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202B43093BC;
	Fri, 12 Sep 2025 12:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V//8tx61"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC85B30648B;
	Fri, 12 Sep 2025 12:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678898; cv=none; b=L3Tcjum7mplSihuEfMGTxsijYDFNNKI8aB2Dz+NqCrpetWJt2aUvwAKv0LJY75waaEsIxIC30J/131rR2Jc0v8t4xk6RUXuxsfP5qPUfXfQpjfcuIZW3Ahw/elIHuKIu1LbAi6PO4LTWK5LeB+2L8zB/63c7r2dmc2XIsNJcKcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678898; c=relaxed/simple;
	bh=06h87KlWkV1Qdl8fM2aLPrnGF5NItjF1URPRbQmcu/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EX2N0HWaas9im1hbD/z4l79sFMpOLONGDUhSXUTkLz2ouxVwy5u6xF5ETZKG0IIDMkQ3Kxsv+3AA+AvJWtu6/bd09umPJu9w9C8+vMU3EXs18S7/bRHJoqva03VkLqWU3/jyScRsNAEX0meQdRYtUGyWCklnzoID1x1sXhGDTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V//8tx61; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1193AC4CEFA;
	Fri, 12 Sep 2025 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678894;
	bh=06h87KlWkV1Qdl8fM2aLPrnGF5NItjF1URPRbQmcu/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V//8tx61ZUc+/50eULoGX5XwUqhDag5NjuiYO0FollJVZYf/Nw5EKE/1U7lE2eL0J
	 R/VVRGWQ69KNy5sm64TdlY+RD3oNYCflvgtz2mmCtMhnq5i0OMdUzn12zMGJCLYSaq
	 X66W1i4IEO3n1PFWtiiJqvNAHHfetXE+SBmoaIsW/WmQeGbBC3I38Z2jZg5jsbDZTx
	 CDx6nms0XGniOtq6MSJV3vuXI9z4YjNt6JbPj/fohIILDqy+4A4CsfzNWpyojqzkjC
	 lDi13wflcTW2iyVGZwacuU5tnZt2tK9lvgsti8MOhAkn6raJ87s3mYpSnfjqqSPmHm
	 R3k2L8Xwoj2bQ==
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
	linux-watchdog@vger.kernel.org,
	Andrew Davis <afd@ti.com>
Subject: [PATCH v2 2/7] dt-bindings: mfd: tps6594: allow gpio-line-names
Date: Fri, 12 Sep 2025 14:07:40 +0200
Message-Id: <20250912120745.2295115-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912120745.2295115-1-mwalle@kernel.org>
References: <20250912120745.2295115-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting the signal names in the device tree was already possible, but
it will lead to a warning. Allow the gpio-line-names property to fix
that.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
index a48cb00afe43..ca17fbdea691 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
@@ -41,6 +41,7 @@ properties:
   system-power-controller: true
 
   gpio-controller: true
+  gpio-line-names: true
 
   '#gpio-cells':
     const: 2
-- 
2.39.5


