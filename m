Return-Path: <linux-watchdog+bounces-2895-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E32FA2F7CF
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 19:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 445827A1C6A
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 18:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F080025742C;
	Mon, 10 Feb 2025 18:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqKfwWjp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACFD25E470;
	Mon, 10 Feb 2025 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213373; cv=none; b=cRPpeavJfYXHKCwW9OVSfvRWrdjCUg18wRLRiauY5urM2LRW741i4C61OJMgOcyXEiGi1lN69sArPrfxrBm/GRuqQ7AEfMbXN38beTaJSIysAcvN4xfOxzOayPsMYfq5yyXfu/AU1F7MeVHYAtJ4E5KZCOEvcRpq7It5U1jaYhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213373; c=relaxed/simple;
	bh=hMXh2wkAiUW5OA/Iut3LyNfsS0AdjEuvM9I7L3F0X5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kn94C2aJR0dbeA6+ehOq5/2G7nQ2wtATYixfI0kk0Y6J7O5np4E0jvm6S1+ZQ+Fa9biKVGv6GBquvTpgwgzrtAXgPmd305PSi1AZlIptKlC41p+DG685gFF+FLYmDrGoyICmbGJ3z6nx58/SxmZKRYOV+4RbknIoLbVvLqBO0Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqKfwWjp; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dcc6bfbccso1880612f8f.0;
        Mon, 10 Feb 2025 10:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739213370; x=1739818170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmKYiYnPZ/Q/sZSieqHb75TL1XerXONUWJdD5j23e3s=;
        b=IqKfwWjp6MsG2wDYYV5azWvlmEgYcT7PFGK4z4xewHXsGdV3bjf0kRMpNogRgBi7UX
         zL2F1/U0jGuyGojnFCxCaNnzt5WEjW4FYW8MJAlfpxc7bPERMlB/VagEAJhtJ6XhqvYX
         l/KGiX79wSMlRa34Fdb0FIt7n+IJjA3+JSkijQeqBqSZ9oiNi5F1yNaYfq5XlzO5r50G
         m0mfIltSxUlQ00PTZNHjB0u4v5lha0KT9I4lweTb1gUvQWdArdt7Sb7B+rxmrv8jg5JX
         oLFWx6S5r68sdgNV+aIE+YofPvr/w/9P5dPbZo4YtxLXQnsSM1Hv+AOlz1VFfIZkoMmY
         fkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213370; x=1739818170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmKYiYnPZ/Q/sZSieqHb75TL1XerXONUWJdD5j23e3s=;
        b=Y9rbZDa86jaZkvjbgv8jZ9ViVrZrPzfMo6hVvBhRvf2umMtNC/opmDCEJXt7S4bsVK
         2l9vZxj1qRYaN71PXhQvW/gaHgQSbIjqRNdau78AQWiNOUzepr9ebNko60XbmPtxBgrT
         q3TLIKsa7AVNzmn/mMhuU0vX4F63on5X/P1gCdRvHyD/esu/jMCKzET2Kv727kB8VGpx
         ysCUXlNVLofABNiDOwB1RM7Olm8pf7Z5QAnHMhJvNCrhseNFOrOWzoPMGALsocyYoxTn
         /6eVxwVUepBZa6lLyWjqHTQBAauIqtlsiR5emQ2iH3JWUPPr5Q22222C/Hd32YFKN9/O
         4YWw==
X-Forwarded-Encrypted: i=1; AJvYcCUwyida2PrlAu4W7Pw37m+rOBv2z21uHGkG++j3vh7iYHPGLTVZPUc/eKW+Exnkvz93EM6/oszOZzJ7@vger.kernel.org, AJvYcCWU8VCmlT9Qbc6/hSK+EbtLLcKxLYRTk0K7NUzPaT9t13+0l1EC96me9GeWIZLdJUs+VN35fQpExlu9@vger.kernel.org, AJvYcCWz4qfyzcrH9AVeaDCOTHAVfcni86u3w0zeqTDRzwBbP1tCZC9Uqwbsme9QlaH8Wr3Pe2OJZRXf5KXevBMx@vger.kernel.org, AJvYcCXfUdmKqdN84mFdH5/v36wiTMR4VMclVAJsUinTd6P0xTXr69uBmoUdVSc8ObrIrkvD0NfK/d+RhyydEU5YKJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPPUBhE5NwE+6BKRiUnoSlrmW3qwcJy4cFb1BlbUifhSgQdIcF
	ZqBEMLJzY2VeApMYbm5xvVM5ptwcXtQCF6tsZ42JwdpVoKbWgVc0
X-Gm-Gg: ASbGncu9EEy3f60m/oV5D7H+r69hEiGzHoY1gTHnUeeyG/MNlC0+CAPghYzDVTuzy0b
	AEq6BO3nlj87VHVCKzjaqFNb4HeUS67+9amvWfgj83eGySzI6eeqgzhd0PzveyJGQTkoTGhRGpP
	4pqBca5fJslSbw0FzZop/KSIR8nLpXfHso0+cF4RS8+9p0vdfxHhOAhkwAcDzY9xCjHlNiQ3bE5
	ymv4x3AcYIMHRMjtHHOHiWHlugkdtWeRonXTSw6/V3YFoXuc9RFmdjlScP17rM7GjDNoaQt/6U/
	ujUUUC0csZsY5ElW26uqxpjQCMN0DqDRY02Oeo4b5KRw
X-Google-Smtp-Source: AGHT+IEqLAXzA5pTIzXCHktxSeEfPVgfqXqU3zM9SSxSIp/ndDEJxWJ5w6F3BxhK2HGhPYeitg9dog==
X-Received: by 2002:a05:6000:2aa:b0:38d:daf3:be6a with SMTP id ffacd0b85a97d-38ddaf3c061mr7816410f8f.40.1739213370356;
        Mon, 10 Feb 2025 10:49:30 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b833:1deb:a929:b461])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439452533ecsm22911525e9.0.2025.02.10.10.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:49:29 -0800 (PST)
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
Subject: [PATCH v4 3/9] arm64: dts: renesas: r9a09g047: Add `syscon` compatible for CPG node
Date: Mon, 10 Feb 2025 18:49:04 +0000
Message-ID: <20250210184910.161780-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4
- No change

v2->v3
- No change

v1->v2
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index c93aa16d0a6e..c366bd2667ff 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -145,7 +145,7 @@ pinctrl: pinctrl@10410000 {
 		};
 
 		cpg: clock-controller@10420000 {
-			compatible = "renesas,r9a09g047-cpg";
+			compatible = "renesas,r9a09g047-cpg", "syscon";
 			reg = <0 0x10420000 0 0x10000>;
 			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
 			clock-names = "audio_extal", "rtxin", "qextal";
-- 
2.43.0


