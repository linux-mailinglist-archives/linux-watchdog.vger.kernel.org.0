Return-Path: <linux-watchdog+bounces-4295-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF0BA91CE
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 13:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9150018851BF
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 11:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DCE306485;
	Mon, 29 Sep 2025 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5HlwL4k"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3284630594A
	for <linux-watchdog@vger.kernel.org>; Mon, 29 Sep 2025 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759146575; cv=none; b=sDWR0sd7RVApM4X/NI1gQfVc/Wy2Y6xl4HAXDwbbHMlqSfZK0IFMN2McGkMS+ogGzFmgvYh0Bmw62U66MIIsp1RWH+XfQl040QnjP7DEltNak7urczIGze/8RHQlmP6/Wpi9poRPvd2qSwrq8vTLedPWO2JKMt/tu1ZvEOE52tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759146575; c=relaxed/simple;
	bh=tXM1CxOM4vCqq8YBToQQUXlfse+Xjw1zD+k6o2Xtvs4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGR01fqD+CSo6eNkns1XjQzo0aSTQTiG+2YUaLxHWzEZ2hdOdE9mFbPf2hRNNygCcBRmkkWdY+bR7DB9F9+XNoFvR26tXQQeeTrkFRY942ZWjPr6TIKM13l3fTSyqWz8zR9ubYz6OQxOEOuFe9dc5Np8QsjjJW+0BeYppS3FSHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5HlwL4k; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso32945255e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Sep 2025 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146571; x=1759751371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIsMYN876VGoFoSvGb+9plrH+kv/tFGDMPOel0bH+u0=;
        b=J5HlwL4kNc05SZ9J6SRAi7OwzOk5KM1fTOB5GEXLyQwIRsqW2488L9/EKyzSiLGDY/
         dY+zVpAyGv96Hcp0Qv2nM//MeW7bZLMWa16XcHHZg7JOIiqzNgRIuPDBsxU/I9g3hPRl
         jGeHaTGVqPLpdY4Vr4C8LDBbfjNa6BQfDF/MSyz6fkdEVlePBtRNvBtNe24od/EXKOGc
         +ooNMv+A7BuvRoWnfY9RDab9wqyuuIF/8JA2OldIJ5925+A7HEFByKZQEbVzbaFphAC3
         ZHCRGw2qOX5wl/aoc3Ll7qhkFzRIn6dm7hCGRn02KAm33CrbEVel4r640tjCAdJe+ZeE
         t/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146571; x=1759751371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIsMYN876VGoFoSvGb+9plrH+kv/tFGDMPOel0bH+u0=;
        b=qIuijGSWF8Tv2U5/exAzZ1G7qDoKmoXeZFcAoLxIOsWwqacB6SYK4XQ41wdgbVekWa
         88TwWq3H5VJtlwqQKqYb2Q+WdAwSE7aP7I7NEIBZ4rzhw7Qe7Xpb+gsbkT73QVl+/CZ7
         bjKwSgZxm604TAyyJxDlmf5G7g/crViS/LL2QRSB21Elrc2TQO6h868f2FOgPmV8BLVY
         m4zfjAZtgc+anmmsv+mNT+ZpN77txBO1znQNG7yBQJ/3GW9pgJFVEOqOrXxpxp/jyy43
         jWQfMh4OddPehbxiA8NnCvGWfd9EMa3jDik1PbyXrMHI6RbUkoWKCpcRthMASdfoqIzU
         6oJg==
X-Forwarded-Encrypted: i=1; AJvYcCUkPcvGzrpDFHsIP3+gr/gEdOCHA5dm4fW5ZAY5hdlShVFbQxIxuTErpy1pJ8sOro6GWOatQRu7qfU/B50brQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3qHdLeqsEFHCcmaNm36oiee9xhkvs55ecO4ew5iFo+9TGtafd
	D5LwifftAIyMoRuOTvGeDd7rol5giJ5tcC+NeIO26eb9+1ADn0hgfPqb
X-Gm-Gg: ASbGnctFR/E/ELkiLkEmJ9EpVpA9dOYCLa2QrRI3I7t2aUeeNAiUggPcyQcm2LLUDAN
	EmpDlEO6ye/kK9DnlQAy6lsZaPXT1a4cOa3aNeOZB8vjevpbehVoPf3db6gOYA4DA2bjVD9ApTG
	I5m6Fp0zmcauWQOD3WHGDKxBbe8iTHT6jKaCGD58QMRFQP62c68eMh9aOvyK2VsMQ/SVcN6JpTz
	l0PJTTwwlW0ovZvAKJHZFbxXt5078TeytFy3QjluqD9J/lbS+JFZBTT8oXLFPLhutCSIPZ3g6LJ
	qVYtDlSkg33Z00WgEXO8oI4x4yJVeIQU9Low5Dck0sULSw/rhJXyRV3/OjbLsD9H9kdqQjuN4/U
	q0ezfbU4JSupwCIo6qNKyi6sKv0jZAOGr5yXWoj2XPLg5SVqZF6qBR7fuO6G5/5Ya2IYjws8=
X-Google-Smtp-Source: AGHT+IHF2CwXyWBOC4BcrLBbsAVVrnt/gxj/QYgegqRmUtsThNiGS8+anT8fVSz00MWmGGHmAtEBwA==
X-Received: by 2002:a05:600c:4689:b0:46e:32f5:2d4b with SMTP id 5b1f17b1804b1-46e32f52ec4mr147677375e9.37.1759146571403;
        Mon, 29 Sep 2025 04:49:31 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f77956sm10030835e9.20.2025.09.29.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:49:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 3/4] dt-bindings: arm64: dts: airoha: Add AN7583 compatible
Date: Mon, 29 Sep 2025 13:49:14 +0200
Message-ID: <20250929114917.5501-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929114917.5501-1-ansuelsmth@gmail.com>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Airoha AN7583 compatible to the list of enum for Airoha Supported
SoCs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
index 7c38c08dbf3f..df897227b870 100644
--- a/Documentation/devicetree/bindings/arm/airoha.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -18,6 +18,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - airoha,an7583-evb
+          - const: airoha,an7583
       - items:
           - enum:
               - airoha,en7523-evb
-- 
2.51.0


