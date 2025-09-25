Return-Path: <linux-watchdog+bounces-4275-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A66FBA0A90
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 18:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60D57563740
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 16:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079833074AC;
	Thu, 25 Sep 2025 16:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VerTbg64"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E4B3074A2
	for <linux-watchdog@vger.kernel.org>; Thu, 25 Sep 2025 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818448; cv=none; b=qfA67ndrwchXz5+mhxpP7CcJigx1RDYQtkYVWAQ/9o4IEwI3e1+yYhgvIF1LJl+4DAdPNyjpEh/I28CNuoBRHUZt4q/kqsEJeM//t+aWX7Ac+Z0E99uZ6QmLZvK3o1hYxYfsaKcXifzCaKUu+Ep8OBVq0LA8wEGfm/4qbGN1jSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818448; c=relaxed/simple;
	bh=MAVG6XeMaP+9pF3hULqJiFuqVbiW3W69qtIjS2eHzx4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=n0q0lk0O8Oxxufabv9T9WsxsBLrdFxWQ8NyovIfP67AbpoPTR8z3hzuYF+LO2XvXZfQy7BbrzhQj/lDLN2XtDqjExllwp2oqXg4DQCJqEBrisRuXBzbp82kjPUN+pdPJ4JEzCK/Fn5PVwoRBaCbY3dgnsGgMuCjUJ/Q+TpN4Es4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VerTbg64; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3eebc513678so1317174f8f.1
        for <linux-watchdog@vger.kernel.org>; Thu, 25 Sep 2025 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818445; x=1759423245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms//Cx2KpQPodFvmBjr5qtYhxMu5fF/NuoJ5civygTU=;
        b=VerTbg64pRKBH8pEy48WmhMQFgelsTYCj43OUSAUK8auqBrFt5ZbInOHXu72cPeMSo
         KPi/kXif2CQjNd5AEXhVXyCBnskfq41aI+iJhs42QwToRsXaAWGL89mHDLSCKzLgSaQW
         qCaMwXBN2dhTGtutISZkfGMgWtIUuxfzeihv0Z6fMcR0UyKrVd+J36EJjs/iRXC9gF9U
         TYVGH+AmbsI21VQzVM2yNkiPrOIyH3mHp1oAqjTq5Rvln/fYPy+cEa8QKsDWDeY+Zxzn
         0cPK32BgcKYbeeIbMjt4rcg7eNKvO2/eIbT7HmLzaJZhCRlgcl35dPU5VEP+cFwIYr7F
         k/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818445; x=1759423245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms//Cx2KpQPodFvmBjr5qtYhxMu5fF/NuoJ5civygTU=;
        b=CgzXd37/Oq/gogbRqWiy8GO7s2UNw6egdbN6bQtxsoNPe9tnP2f6nux/GSC/AEOTs0
         rb6vo/sMMPlfTtSyQnVx79GUQJ7mLIo+8qDSCA+TW8cSluLSQ+k96NbHEL+lmtMwegTH
         1GV+1SSErqYldDHYpvSx75LiD1XK/NJXYxE7LSu68KUVktRm+d8+ow+kwFgROD/OaucF
         dOU+JaysKt926uk9DdzNMzSw/laIMlZCAzDHBKEN/dWS/kWIqTdaIkeIgB+Hb2xuAh3I
         YO9IjmZAwgK6z6qqFVBOsUIbSfQVO2hjO5+JqMqdMeeBHPlmKUaFzXfA0JYPmDRN37kK
         FBpw==
X-Forwarded-Encrypted: i=1; AJvYcCVlaYd+Ul12rxlvSnB5IjN7md18TaweY3OlR5VlwEBzVrr5swTrjiZjpq2zsQAMWZlBJOxiByfnL/qmqb5i+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAeCKvG7WC69RfFwxkiC3behwGTSDFlJkwgxefPDYc4W72HK72
	Mcqralr9RfNsKZlyx2m+pZU6SjeoW8Fzsj+DmylJGX3hQNat+3fDMjGq
X-Gm-Gg: ASbGncvlET/x+B2kwklF0yL4x/X7nRVMSA5ozmPFiMspCyS7DT8eiBj444dxAY5Gg95
	ZvZDXUud9UIw3BCsva6tLQa5O7Gy85xC5jBhPFIYl1M5LjF3WfEYfY+KtmQZ9srN/034RQSFPI6
	JDx+kxBykl21ItpMLX8XvSmREpBIDWPhbQR5DBkaNQ6NT3dWfbqnRGwWqs2wVQMPWhmM0wVbvB7
	srADuyDaB+G3NMSELoxmf+GQKbu5Znt/EtkdQf3rg1URsNXAAeYuFJauF93orJZgWNnTplHV30T
	IhAPIaHyNZ5Nqqt1pPWFvNV+JAEbCS8jdwfX2YkABX0VboBHRtCne5AoU6aB3d9ieMnFJT67ToD
	p9ZEi9K0TNQjVMgHRykO5x1lX4X6BeKIrlGB8PO3s1g/cYo2iNOL07Gz13xW+h4kNwwrU2pc=
X-Google-Smtp-Source: AGHT+IFhsb6qW5/GahKJeP2Wl3RdIGj6vmskf1jEdNXYYA/Gj3jq1OBG69r49jeZED4H7pHpv3jTpA==
X-Received: by 2002:a5d:588c:0:b0:3e7:6268:71fd with SMTP id ffacd0b85a97d-40e4cb6e2fbmr4192124f8f.52.1758818445399;
        Thu, 25 Sep 2025 09:40:45 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:45 -0700 (PDT)
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
Subject: [PATCH v3 0/4] arm64: Add AN7583 DTSI
Date: Thu, 25 Sep 2025 18:40:33 +0200
Message-ID: <20250925164038.13987-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simple series to add initial AN7583 DTSI. More node will be
included as they will be supported.

Changes v3:
- Fix typo EN7583 -> AN7583
- Add specific compatible for watchdog and crypto engine
Changes v2:
- Fix DTB BOT warning (fix crypto compatible and OPP node name)

Christian Marangi (4):
  dt-bindings: crypto: Add support for Airoha AN7583 SoC
  dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
  dt-bindings: arm64: dts: airoha: Add AN7583 compatible
  arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board

 .../devicetree/bindings/arm/airoha.yaml       |   4 +
 .../crypto/inside-secure,safexcel-eip93.yaml  |   4 +
 .../bindings/watchdog/airoha,en7581-wdt.yaml  |   6 +-
 arch/arm64/boot/dts/airoha/Makefile           |   1 +
 arch/arm64/boot/dts/airoha/an7583-evb.dts     |  22 ++
 arch/arm64/boot/dts/airoha/an7583.dtsi        | 283 ++++++++++++++++++
 6 files changed, 319 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
 create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi

-- 
2.51.0


