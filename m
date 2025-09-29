Return-Path: <linux-watchdog+bounces-4293-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDDABA91B6
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 13:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DDA71722AC
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 11:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24F9304975;
	Mon, 29 Sep 2025 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3yj2FzA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3C9304BC2
	for <linux-watchdog@vger.kernel.org>; Mon, 29 Sep 2025 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759146571; cv=none; b=hiVLA3Da58uifKhAD02dRz8tXSVwll2/5NMN9fBZGI7zglz8JCU7kxMDzLsM6n0c2qv/YXybWAUXSFmFpvrgSJhe1jPDu5XRU3oQjRX5cLm7uCs2Hz4d+4I9lG0zZaCNZnsrq9khdMfksAUwqYFuRf49Ok6d7SoyaR0ezHSesRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759146571; c=relaxed/simple;
	bh=/3d+DNZ4lwjm+XshHn87ADcx87J0m4/hD0vp82cIobE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftNl4nKOoN7/TDviW6qfV6SIdT/2nGBbt21ZsL6Vs+k8Afg+qKWxi+t7khBblZZNwz96JzdO9ehhF7myglhi3tQei5kBNxSnWtYKtO7GNltdCGagLtzNsUUcMV8Zyen6k1gSj/RYJbQ26x8jYKJ7ZbmLG4X3bOcSGzyNkHJxMPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3yj2FzA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e4f2696bdso18058015e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Sep 2025 04:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146567; x=1759751367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYKIS6AUB4jbN6LRMHpfAVlAKJeZBTFDpfK2oWN9FEQ=;
        b=U3yj2FzAbuZabJWr30ta6Vu6V0YKyL7onfjk7bUGso4t/c/EReg+D1o5KlwsyK1C/U
         mrwvK8dBP5xy+I4H6akbQRoOtbVOrSyOrpyXXE7lGbmKhZMJXJKgIvVYWvnrwFHVjaFO
         tmxoiO2vuX2XcbkKsO5KuGJivrWuM7TqmeXevvV0LSUwKqoLfZIvAkIrf4rZ2xxBcPPI
         730fAOBM6BCtQZkAv+5Rp8amAfbXoVczRblU+0sghTdqd00jVs06M5Wp4LOvV9avCFLL
         DQhLLx0IfMbebSiaieEFPO42UqT2BPM4/epx69XBW/BI5qgVf1xQnDndssv0NHBd25vo
         ZPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146567; x=1759751367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYKIS6AUB4jbN6LRMHpfAVlAKJeZBTFDpfK2oWN9FEQ=;
        b=H8SdYxfKbleDRQ4ix4yt/idLc5JRdun4uH7Rv7zus0GjR0CtH+4lw8H7Qlle81MKB7
         O4L1r3tTiZDNCwvqNneR8ls2DPSy1jDT9s0ONxsVL/nJffUkLEkNG/t3+qYZhoYqSh0V
         C/y2nVT3jWp4q7aqYtCXg/avHB3p2eDi32AeGUcuUI690+l7dHGy742DIWKkh4vVnrAB
         jaNlyBqNDGFBoBd41Cx9W4JWmFO1FpTVP+Mfd2iqQPXe7LEbHomW3Jq2QnC/JBj6u2Ap
         V5xdjxTOU6TM2DhjxW0/ZPFLp8Asw19XuKf12wXhntNZHaqNU6ONNxofdHOiL40Mst+b
         ZEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtn4M2S89rmKrDYn+Drw59sUiHQSc1eeoBo62DZEl0X6qg0ZjWcWsRBZG7Ey5xnHSJzaoPifD9MvxmmlFtZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOh2EVdckNUbRwVyP4qmd+jOnheOew0lDAsgo4qsaA9sxDNr3l
	ATsXM0gZp1QmCKZ0+PKRoNGsK1KJc74DIfcm2/Vs6ii+SKehjySfogfl
X-Gm-Gg: ASbGncs6N5w7n3CKI2gTd0tcIeofv3zgTt/aHZYWC+9fjIePvMIm7kWRN3342TzPNUf
	aAaZceyH1zAAe2eiCtj7cwTgPDzf1L3m6daWeCcM/tTAWeukS47DZqnJn+0tN0xJIzff4i+c5Zs
	WsP2dry/TOYNiwAYepfWL4LeWE7pEsReT2pcUtxT9RzZzRBQliRZ+SncxkXHy6tfeClHWky113Z
	ISUO8gkb1Ara5kXKZuB/ciJvblzw5KSBatP7J+PexJI7XB2kyREgHDK59l9enMN2K38kpWHSBS2
	aDDE0ojenGJiDGfZIamkeHqzeuO9MK21L67QAzqn+GgEmVCfhngOUcwnPSREr57baJ7guAhP//b
	ScYFOqBJnNpqluzhy2IM0+HWTqIW760P31xfcXygCANeE1/2M8J5FO8Dg0Q0ceG1IZ+aGNJY=
X-Google-Smtp-Source: AGHT+IGuqXMPmewneHZfTKdYco1M53FvKmmiliFcGFMcT7OaxUtdD6+QR3/I0y4H9RP2qzHFLrfHpg==
X-Received: by 2002:a05:600c:468a:b0:46e:4705:4958 with SMTP id 5b1f17b1804b1-46e47054a6fmr69438625e9.30.1759146566851;
        Mon, 29 Sep 2025 04:49:26 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f77956sm10030835e9.20.2025.09.29.04.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:49:25 -0700 (PDT)
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
Subject: [PATCH v4 1/4] dt-bindings: crypto: Add support for Airoha AN7583 SoC
Date: Mon, 29 Sep 2025 13:49:12 +0200
Message-ID: <20250929114917.5501-2-ansuelsmth@gmail.com>
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

Add compatible for Airoha AN7583 SoC. The implementation is exactly the
same of Airoha EN7581 hence we add the compatible in addition to EN7581
ones.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/crypto/inside-secure,safexcel-eip93.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index 997bf9717f9e..2269d78a4a80 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -30,6 +30,10 @@ description: |
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: airoha,an7583-eip93
+          - const: airoha,en7581-eip93
+          - const: inside-secure,safexcel-eip93ies
       - items:
           - const: airoha,en7581-eip93
           - const: inside-secure,safexcel-eip93ies
-- 
2.51.0


