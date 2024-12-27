Return-Path: <linux-watchdog+bounces-2634-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B6A9FD724
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 20:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F2F43A20BC
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 19:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41D81F5F6;
	Fri, 27 Dec 2024 19:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBlGmJTY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DBB1F8AEB;
	Fri, 27 Dec 2024 19:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735326171; cv=none; b=UKtCNkZBgmwlraLO7zHq6I1qTsxwRF8t5z1spXkhtt2aXvmWij69YIAJRFPDWUIt2CbfRbRLiQ0wZLwVR1FpnlfHgDdg4cXVI91l4sYT8zGy4YbEqVwDuXKE7WqJ3Lo8YPX/rLwXNjdhSuLTl6L3R2RfvgBTMjoluBrDZYhhnN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735326171; c=relaxed/simple;
	bh=LKbIwIVS8ahWYP3KGKr+sv2tpuCRtT5vtpg4vth9a7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oB/g+ISNkV5vUsPEw6Ac1eYOtvQbpmahyWEul3jw6yh020rEmsx9Ye8ZQsylXY7hipb4Oiy5rAkQTlz5LcWXPESMn9DrvXSXeVg71phsVHMOdk9/zXPZNmjJ6FVJzEwhSL1NwoZlW85SR7JYN7rZgqkscIEvfiAHKeoMN6pL4W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBlGmJTY; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21661be2c2dso83133105ad.1;
        Fri, 27 Dec 2024 11:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735326169; x=1735930969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=si9wRSMhcbgR5g9haBjn6GYu6x2QgnxAkNJlfiLjztA=;
        b=nBlGmJTYpJ3uwhowKJE+uamOVUT+dQ0ZyOSoT7qhzhX66c4tACS035ghW96abivJ4q
         V9f933GfEuEjNKAu3a9gIxsMoLlNtMfDU4NCVX0y2xe/RmAjGPsyK2hi1JsiemvtapfY
         u5b+fdjU2NkOLKMjyCGbWNPVTpce7J1XfNFjeUdl+InxacAcTAc+YbYLlGqXuk356NKf
         8VUpDbqYJxeewfTnR5ymKSZIumPNp+suAekXBTQXz2y3Ofxx2MOIn3iclVPHbwusveMl
         obg/UhL5nPIqhqtQpMVNeingBm96beE3JPb7JACa2eM/Q+ZOJKxfD1Bfhdk3UL0VnLil
         Lryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735326169; x=1735930969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=si9wRSMhcbgR5g9haBjn6GYu6x2QgnxAkNJlfiLjztA=;
        b=Uh9suTvSHzMN0DSuU0RTElwv4g5jB+9pvgz6SaXNYIaX1XeoLKmXAkr/vlGkYsSWw4
         nGDc+9Za2UwtojP5AS9PxlgRKHoj2ZiLvYZhusviTyBky70RAVzw2OYqiZh+u/uldawO
         +wIQ13sOkkTsfdXPSJ15mk2qN3/181+4iSJcQd7IU2buWrjpvONT7XtT4s9QF3HeOeQV
         FbPggDv/bOKpBre2axpAavP27pNDADqAwjV2zltTJPiiI1UMUFcLQHvfhzxgXtNk7PNA
         OSd5ukR5AjDpzGdIeZ38/7vN8OZZJSkTfnd4C8Djfn9dYKBEAPuesi2R0fghFWU6cxVK
         bGrg==
X-Forwarded-Encrypted: i=1; AJvYcCU+liLMFRnu/wuHrHNAHbVbIiGucbMu8uKHb2CAXY0kPL3A6WASDIDMQyoJeqhYyYT30Ljfi3r+hFfl9R+Ghzw=@vger.kernel.org, AJvYcCUF+83lX+5Q7rqqpADqKFsTZ7fYD/xS40rn7VYWL6trQnbbvVJOu9JHn0WxD6jDDQob8hx4sDe/GTOq@vger.kernel.org, AJvYcCX57jRRLBohnq1yaz+kzF/wwjgFIIFDMJ2z7q1wUKztoFv2o7PRwH0zmoJ9RkKuvjThEn4Q/fGZ5/hN@vger.kernel.org, AJvYcCXOXBk/WOMkzEZWy8wTfrB4Pmu/qtZ1mCWqZN0GqCD8JHTdzSBHbc5mBmoTeYGJGEjYQqL4YVEhnWyrv5zH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ETIHSXGX8N6smoaGHSIgnr9kPDz4HOoQZWa16tOjCP52nNjG
	2gqPgfIVfVwVS0zlydsTSJUwnG1EiDuzEGR0+Z33WXk92YrplnT+
X-Gm-Gg: ASbGncsGEGxAbPAPK0A0pIRTNNA7ZOJuBJqCSORkTCXmiEfdXY6ivj/IAolUUCc1y2d
	K/Am16/NHzoQoB/LO3+Nrzm5KxYtW36fB1MVQUE3XK8ISPhYkgmo+iutt55Sip2AfbHGuysgkbx
	Usmf0FZDIE4hRDm9hhvV99LC0yrPF8htgxhaS7a3MKqHEufytweJqk+jwKK826ad4bzxsUstZXX
	3VkYXEh1Ghg2k5kXvpDsesgytGWbcHUZGS40+gjCHdjucIs7tyhH/zfgGs6/VKTe+lUSYRDt85S
	26yCx80=
X-Google-Smtp-Source: AGHT+IHFWZlSeBYDyhxsbl1ysAqyPJm4kVzjBWcfoPEy1nmrzIIWuvaANYguQyUFwTlyiJWc72mOdw==
X-Received: by 2002:a05:6a00:399a:b0:725:ead7:fcae with SMTP id d2e1a72fcca58-72abde9ec45mr40940408b3a.18.1735326169318;
        Fri, 27 Dec 2024 11:02:49 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbd3sm14877943b3a.110.2024.12.27.11.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 11:02:48 -0800 (PST)
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
Subject: [PATCH v2 3/6] arm64: dts: renesas: r9a09g057: Add `syscon` compatible for CPG node
Date: Fri, 27 Dec 2024 19:02:07 +0000
Message-ID: <20241227190210.69025-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index e39da64a32e9..69de6c302b17 100644
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


