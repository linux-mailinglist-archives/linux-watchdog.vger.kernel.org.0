Return-Path: <linux-watchdog+bounces-4276-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E2BA0A9F
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 18:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93A541C24117
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 16:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962E1309F07;
	Thu, 25 Sep 2025 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2CgI8rh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A3F307AEB
	for <linux-watchdog@vger.kernel.org>; Thu, 25 Sep 2025 16:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818452; cv=none; b=hBs7rIRAPwPA31KxJpv2GaLjQEf2m4BMTu03frSiT/mp6xeHWjuLBQYaRlDlmJ7txK58nghZk4SadTaREm6tvK4QxP+5QqUYtYugw0xlyCKOgxgEgMRigQBELjRiijtL9nKBJEALBZYA4tjka6Um1OfQ3V+fAZ6BQB7al+yBkKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818452; c=relaxed/simple;
	bh=5uSR4NDN/aBsd24THGZvPsdUrUX4xTeH0oi/5l1dY5Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9cB6XJohh+EOz/TWNE9Y6HTcLpra+79MJDF9P1kHU81mo/glFRezLHK6MK5ME8C266/cGwhp4c+N7tBfROCxnlxJNB2mYKywwNrfy3QRHAvEEGTAHtkjykaxnq23twiO9UCUuiAGkt/DqBV87aLRnn+ceX+Lao/dA5q9DT5Jr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2CgI8rh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so8126885e9.2
        for <linux-watchdog@vger.kernel.org>; Thu, 25 Sep 2025 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818449; x=1759423249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4zaJq9JJc/9ryK6cY2Xn8ASZ9hmcyfG8y41VjWW8NY=;
        b=k2CgI8rhkCMTu/2Fr1Dh8tcv82JbH4ZgDFX1Q4Ee7Pg0oxEvu6D6wbQv37XQ3ypxsP
         jNaIGdXt0YKXBUA7cPguKcXb4J9AvGehE6wXA0YBZXs8sjDtyuEjrexGdjFWdLPGKkfq
         BSSOF6DgnNWnnaoN39p7WYPook+azDZVSNugF9/i/kV3FK8vNOSqA61xBbRaJ+qcfTyZ
         IyPEGsY732RpYBONwgC/e5LKZTcNrqzzpQriI7/T8go0IexjQe5/Le3J0neFnuhEm057
         HXZDb4Y+utK3U0kI6xVvYpv/lsR3/j8SV6X/424ae+jKQU48uL50UusYy0RI9WNUbSq2
         mKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818449; x=1759423249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4zaJq9JJc/9ryK6cY2Xn8ASZ9hmcyfG8y41VjWW8NY=;
        b=XALw0MSL4XHapPbTBVdBFr2zhFXIpsbnLvx330DcW+vCniALYdjimt/3gc1ynlJX2s
         eKycump/+JW11m+/kxIBcn4gEH0EHl65BGVItvWn0fbBb8ylvAkyaHS4Iybj9Ign1FL+
         kiDIlBD+2BwQtMoo0gCGl+chnfq/x1beqtuvZ+XZs7wi6syQLJUDottiRQr7TkOZuvCz
         dPNybuDvWLmvQQI58TthlFs8ao8453LUYOueqQhwAtRMamkqOa/7/C4g5BPSxRWch9t2
         Q7KLgOCfyW2nYA1V9yr+BPZ8m8OAdLMYr8Qpd2vW9E2kIuADsEM6g18kQl4+hc7dWOPp
         4FYw==
X-Forwarded-Encrypted: i=1; AJvYcCWpmNaHXSD8rZ9RHkvMYk8d08gw22J6t4lD2wTyZ2R47Dl1qTBbFErZke6qu5ys7qq2Oh1CCHE5LfCdAMK1Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YylBKLyWYaXCMWxar4lWkiZ65Hs1nvCWYs1zAihG4G3mWrMGzn3
	CV07VwWKbgTAb73+pNdLJ0aFSxnDR2xrdlp4jlDrzPgefhos/REcVM8R
X-Gm-Gg: ASbGncsv8DAAxqmaQFCdUqk8aX70Xgp5UMOgUKEJNoS2k54Zsf5yPf20sdUZHW01maG
	I/96ZUqQCJXooD1LdNTULM9yi1j0xJw4FPXt4DaQeUmkSXizUY0BnrRKvWZiMEQHPXoaB4SOKkQ
	Aife4UyzAi+IcNO4Al+W0C77fu0Mmff8vqNiBC7DBWq5zr0TiZFZ0FaxmRj0REc9j2P+d1AfbrB
	FryJvSFVud5mjvfI2ah8SYM8WR+YYM0v70HUVeJVrzq/19+u5A6Zf+wiCnu8ct3MRQ5thRUpSvW
	6FVj88eQmNC83S9Rg/cUZ4WFn+SuSpzE5fAMJTMEMzcRhrXt6sBcl9r0I8mwMbl1+II5dfHOICB
	CTKW7V1+toJIWZaAoDoCxvxbXjR6MiePq5gHp+UfrzZSXcGi5IuCT+XOTSbdyIILHINNppak=
X-Google-Smtp-Source: AGHT+IETYpPO9LAGX7zUAqFXRCr1IR36jr+nRkmsy96nynVShQ03CfruIEzXhdMASLXdFRjMR/RaLw==
X-Received: by 2002:a5d:5f52:0:b0:3cd:7200:e025 with SMTP id ffacd0b85a97d-40e429c98f2mr4337564f8f.5.1758818448972;
        Thu, 25 Sep 2025 09:40:48 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:48 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: crypto: Add support for Airoha AN7583 SoC
Date: Thu, 25 Sep 2025 18:40:34 +0200
Message-ID: <20250925164038.13987-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925164038.13987-1-ansuelsmth@gmail.com>
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
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


