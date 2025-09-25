Return-Path: <linux-watchdog+bounces-4278-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72645BA0AB8
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 18:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DE72621FA9
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 16:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4720D30C61E;
	Thu, 25 Sep 2025 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWmYQdQe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997CD30C375
	for <linux-watchdog@vger.kernel.org>; Thu, 25 Sep 2025 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818459; cv=none; b=hEkQms1AcYfzZ1rw8gDSi6/ANUg3d2T14XT819ENAljQ10v1UOMpq3gigT3X4aE606oWCJIa/ONljeTUu0td+9Ttq3dIoUOZ9Q0DCHrxPnc62ux/MHiSwG1of4yOyQAFfiRJDH97LrzBTvloLfWbthsYlxts3r9QKVYk+EF4krI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818459; c=relaxed/simple;
	bh=v7/bGU7ZHCKWwoPLxIX6yU+W6cwtgrDMpcJa/blq4Ig=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iam91O2ZZh0xPdYAh1WaRtfQgutO4SamZ8KAqVVY68VzS0TUBgFRIYmqWtAv1BlPJtMqhckey2OnuIJ5mb4Rsvw3Simqgdgr1/9yrQLOoo4wYPx1nPP181UwsBuxmnlZL7pRMEB5NAQ3VmdYFHqThXImNIEp+ryvhcwsqzeCxDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWmYQdQe; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso1213165f8f.1
        for <linux-watchdog@vger.kernel.org>; Thu, 25 Sep 2025 09:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818456; x=1759423256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOcrIoNr25HDz/QJv/9nz1km8B+JKQd3A3tnWDgtjkQ=;
        b=XWmYQdQe39PjSYHTPfQ8BN8pIXpLGrUwjcy4s+P2SIQkq1CDiIsZ/ivXG80BvKdPf2
         0YEp6AwNRZNF3Qfy3axo7zfu5Q+zAFRuSY/toJLvRa/l2uSf4Z1Yp2fR2vcf/TOe/e/A
         r4G08N/d5aJlPwNXX/Nx+uQ5fk+f87BsXjmjxWdvcaQ4RrXmilNdSi1D6ENpUXiZPM1u
         c7FLQiAqdpr9xexiVRdelXH32dsWLQkuXbRzt0cuwmFUjELJO5wcofLuubbvBYOwpnHf
         6QuK+z42d5AX7GXFlFCLHgofUpE5v+yWUBMzigUnowWU3WvQnrogzi7ULa3KNGq5p//h
         Cmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818456; x=1759423256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOcrIoNr25HDz/QJv/9nz1km8B+JKQd3A3tnWDgtjkQ=;
        b=wcH/05S6FsSOl6DSXR009HQ3/SNVQ4LOTOSscuvQMHx7UAlK/LD5Z7I9wEJVtWLBgm
         WVJzN93f3HFlOxc9XWU+6HB05DC+PIbnycg7wcJgxJMvgDtYcY4EKFNSSOV0DOKABtd0
         iGUs8nXs98wc2BmZCrrxKEta8xMVfNRnTjazrc5Ylvnaj8t+909SDE65l7mF3cSrToJn
         PvEz/F9OwSi4440VqDhB6YArCQXiaSO4frEzE5uAcehykfp1QmpjCPxoVkPiJ8jN2tUv
         SW+nvPzzUX7xwUHg3QDPcrtZjxeFkOATGZJ2EZ8IzMDxf5dc+agd+UEG1q1z1s3SvdW2
         kJOw==
X-Forwarded-Encrypted: i=1; AJvYcCX8mJE19BhgaDVDFqTcY4dNZ25JgdnDOKparH3psLFZmNcr/qbYigjx8eNjgBSP+gVzAIXV0qNXRUfdcaN+iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvZn2lnWqMnx4ZEmtwKzsVAofRLL8D6hZV9alJNTKv/RytoaQH
	AzHfDSLEY0ODvFo/pckqJDoZrWWLVshHirkfHL4dMb3Ao/knAEqGl0Yy
X-Gm-Gg: ASbGncvrjb/FwasQorSjj0ecSXYQYT2h/bHpzL3NPTsYAzIKQD45tpJhB8AWRmji/Oo
	UECqrAUpBEQMF976O1Y3/C9ysgqHb7DM8CHbBrwVWc8UOImngqdJiau++hVCdBlqP/mK2C9x+BY
	4oB7XbD62bH3Lih9p6Pw2/lYNXJGvF70CX30ObIxahYNxPEDWcBy3z6miqjMDU2gLyTBd+bjvzE
	SraOZZIZsa9i4j/44SQHKR8m6M6sxl4SCWzporhqCTaWp+9ZoF3Ust4Ov7Xn6Ik8actbEqPopEx
	j5hm+i3UqV+zI/jxG+0RX75OW9C0Hw7COSkfRu4KoMJmn7uT4g2zuSf9K01zE5zH57QHDvVVW1s
	kaSdt7GOBZOMMb9s6/vWCkbcLDpt8UvM0Ybpp7i5l8Qr5NMBmNAxPS3fFhb+8NGtuPPkfX6U=
X-Google-Smtp-Source: AGHT+IHX/CI2L/vfg9Dj8p1oMbt+FsoCRcXjcK4DCzITBXnWVWzmuBAbvqxNfCx8Z5RM2iRB5ODlEw==
X-Received: by 2002:adf:8b88:0:b0:410:3a4f:1298 with SMTP id ffacd0b85a97d-4103a4f15e3mr2182661f8f.15.1758818455924;
        Thu, 25 Sep 2025 09:40:55 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:55 -0700 (PDT)
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
Subject: [PATCH v3 3/4] dt-bindings: arm64: dts: airoha: Add AN7583 compatible
Date: Thu, 25 Sep 2025 18:40:36 +0200
Message-ID: <20250925164038.13987-4-ansuelsmth@gmail.com>
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

Add Airoha AN7583 compatible to the list of enum for Airoha Supported
SoCs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
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


