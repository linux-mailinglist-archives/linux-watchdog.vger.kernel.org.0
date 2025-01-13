Return-Path: <linux-watchdog+bounces-2678-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3299DA0B57C
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 12:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30CDB1684A9
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 11:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19732246323;
	Mon, 13 Jan 2025 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZ0sBvzq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB072451C0;
	Mon, 13 Jan 2025 11:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767445; cv=none; b=rN9oDFhThuiVtDnRJCvkITl8e6VGmXJtULeeIQU5Y6ZSewiQvO67Hjn/VwxWRUENbet70vHyA2TBcA1L1pVDLtGPyQdOC5D81f59elNTBoxM2R3gDsKx24e63LzLm4s6k7apFrrUU3XTGUl/SlG5NBDvOrN6OcDPV2c6xMjQupM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767445; c=relaxed/simple;
	bh=VZQhzkAi+f7HNeJ5UXFl8wKeHOQjQ5O+04D4CkQZn8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRieZUwoYFrixGb1qfAVA28woDdJGns9ciao2Qa/moHYSKOi93WuQrIZi+sD9++CsA+vE3lKdvyJ5hQntqGcmFDRgVwfTf/RlWjqoibHorVx6FqBmRKRqun3A3WCsQU709CayAlTMm9UJzWSvbW67uQgwk35SJJ1hAXDCP6eAq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZ0sBvzq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43621d27adeso28508095e9.2;
        Mon, 13 Jan 2025 03:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767442; x=1737372242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wf+FxyAJJ9Wc8AZUpI7y2tkoMuoQOHrn1/o6c+UYRhs=;
        b=OZ0sBvzq366DLb+ZGl6kvkmTO5GHNDGRGoxWpX7hkunrxott4KiXyHA+KhFNZpRVxp
         jzwf64X+lZSCx4WAsfIzB7eaG1U+DG8JX+SsgRVtGO93mJ/RioGbM6pLuh+roAckTHoU
         bfprA+CzhrbhrYYbNTQ1O447PJTXaXMw7c+eohac98Yh0vUte3dny9UbIulZ1FRpKSnX
         ztPXptv3APxyczAkcK++14pZrphXqC56TXnPLbx00vAke7qAQE3hswE7gdERj5PW6Rdf
         a6duu0SBi4l85a4X7G2D6JYrj+MpdqjR9h3qPgy+wWT+TuJY/w/Itk52draUS8KF1lck
         3P4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767442; x=1737372242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wf+FxyAJJ9Wc8AZUpI7y2tkoMuoQOHrn1/o6c+UYRhs=;
        b=wtWGfDlLRmFMEk5NZK5lO/tvodMCk3pBxqiace2YeIIwqSfNbYNZ4phS8C2aUvSzKs
         x/jeuM11hCWMEup0hD4lA+fdJesKLFVuCgnCz5ab50v/5XXMbYzLatqWxmEtu77+Y3pE
         F0zUF5taE3G3oSEWa/XT7OaLK+hNOS7MM1Nl1rkZWiy/YWzmcKn+y/H1N496RGlurDQT
         gF5Co7ucRr3lDzUjP62lT6IOhWIEN/2hapWtuHcVIfeokwbt/TaGOX2R0z7kbTIc98oo
         JM4L8U6TIiQAlTMMPKBNsigEnLtGo6Dgz+m9VZ/I7iBkVjx8J75rnxY0Gktxhhq8lN4X
         AoUg==
X-Forwarded-Encrypted: i=1; AJvYcCU0Jf6Qc0Lk3pMXduKlLsN8cSj8/1tRHs6Hkt0AIjH3sXBYvZK28L8RBphlh4CmjWY+hy43b4NeBzf3RQvR8/k=@vger.kernel.org, AJvYcCXYKo3KBFA272qEU67apulFRRl6y9GdBMf26YloIVD1YuQ9jF3mxbZJcYW1iB+Ey/urGepQTC37go1L@vger.kernel.org, AJvYcCXf3ImetnopzD/GjqdE1YgDAXAO/AsL3Ms87j9UTXtdRUqYq7ePwktpX0/YE8ilG6U4G987zUnUyFSfFfAS@vger.kernel.org, AJvYcCXkBy16eUWvKYcQC/qh1Z3GGqgRUI25hOUtMiKBsgYf5IEsdHL8t8c/EK8ltLbQ5sAam9C/MNccZqC+@vger.kernel.org
X-Gm-Message-State: AOJu0YzxaCd4FyxRJYO2TXD4aS2F6s27ZJaBcsS41mhALvHrajBlHsnn
	GvopAAji23zwnItPOfk3jjEvNe3Ixr2CWaIM1AQI5sEaVR2w5f0t
X-Gm-Gg: ASbGnctybvqeMji9UK0Rnp+UqLJL78biUwTXSAYl/vxWU2MA954pwa/YGG2L3UUJBvL
	BGh86zQBkuqi609CT938nIWK8/+IxaS+5WEmN3851hcf3AfOpmHoYCHkyclTnb+9Bg3CX+/8CnF
	BtZ3QuYYeig2kLbAbf3HYvxSAjGtkT62F7/73B+TE7haOvvQn9T2SI4rka0LLpX9FjHZlXl6gpH
	QAwZnAn+gMwyMUkDz5tg88k3fT8hY6T76rNE3efL8XEAeBlpufWIKL8noCBUtpO/2bpRsvarWm+
	/ZT/U2E/lA==
X-Google-Smtp-Source: AGHT+IEVDQ0q2fm1/v+6iiU6Jp+0FZ94Ci4/jq3SZzXn8dZfog5A0bBVY72X1f4t/UbMN53FwlaSLw==
X-Received: by 2002:a05:600c:3b0c:b0:434:fa24:b84a with SMTP id 5b1f17b1804b1-436e26d96d8mr160948325e9.25.1736767441354;
        Mon, 13 Jan 2025 03:24:01 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f04df606sm107597115e9.12.2025.01.13.03.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:24:00 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/6] arm64: dts: renesas: r9a09g057: Add `syscon` compatible for CPG node
Date: Mon, 13 Jan 2025 11:23:46 +0000
Message-ID: <20250113112349.801875-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `syscon` compatible for CPG node to allow the IP blocks to interact
with the CPG registers as needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- No change

v1->v2
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 3938b9740959..e7428b80bda2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -243,7 +243,7 @@ pinctrl: pinctrl@10410000 {
 		};
 
 		cpg: clock-controller@10420000 {
-			compatible = "renesas,r9a09g057-cpg";
+			compatible = "renesas,r9a09g057-cpg", "syscon";
 			reg = <0 0x10420000 0 0x10000>;
 			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
 			clock-names = "audio_extal", "rtxin", "qextal";
-- 
2.43.0


