Return-Path: <linux-watchdog+bounces-1184-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55358915548
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Jun 2024 19:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F9F9280CEB
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Jun 2024 17:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F81219D8A9;
	Mon, 24 Jun 2024 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVcOEXFP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96204179AA;
	Mon, 24 Jun 2024 17:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719249948; cv=none; b=EX/excZCE7znd/N3SzbUOghaETRK7VBwDHT1TLSSpYfyM6GLfkZ/REYHAR4Hrb5wuqIWB9wBnym37ROtvuIt8Ohayuzh393jFImX10VrX69+ZZAW5Ss9FMqkCLto+P63HncZZbavrbecDnnCu9oJSD5RNYt2xO5fsWTTtO4S48g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719249948; c=relaxed/simple;
	bh=9Fx3y+RGQy5iRyY0sJLMaqHk/ggeCACEEGValnaOj0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YsTfMLufsTPG2fXQp26Q9pcO19loIRQs399Aq5lMesjPvGtU90C3WmkYXATD9QyS/+reIIgVMzHHfrybHo7GvBd/IWDTgrQyuqkGj4lVjviAyuzdLUEBwanpYwRb+NkX07oo5PxyoPCUj45PtM9s8S1GIhjWguVRyheJQYOljKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVcOEXFP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so3502577f8f.0;
        Mon, 24 Jun 2024 10:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719249944; x=1719854744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwYx+K0nxCDlnHLtM/XdT9LfiVrp+4LlfN2T0Y5wLUc=;
        b=SVcOEXFPon7oIs9ZtxSNPVxpbNx/l40igf+0pIZOeLZFnIS7qfX9zM04IXlfpa+1cV
         id4vPn5Ak56XDBCznBiBcOORFqx2SH7/251EB6oscB4dFFgZmUZ0Ts84hMN9QJ1lbAXG
         fi/mLnPaTk66yURcoGUNlbYV03CmERLeM7iEmxNslMZpQRh7OSw3I9S3kj8LyqsWLWvx
         OYGjEiyN2HWvML56Sja5O0fyU9ozrIYesKaFZu5s4QSn3SBwschHPFiuagHxBBRfii/v
         kQJ3Ouqx+Eb7xH8kG7V5vsSo/39K618c1xoB1TrmB4dAz+R3KSjhTNFD68EZCzZqF2Wp
         3Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719249944; x=1719854744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwYx+K0nxCDlnHLtM/XdT9LfiVrp+4LlfN2T0Y5wLUc=;
        b=pVA0WJ9M+U7AJY1iYl0+6cayNOeAE7uZc698nVlGd+JPHWRMC0AVfb+7ZKfvucGXsu
         FVRwgmLamaLAgoc+vuPpltaEDW7w+gpVxnMUw7fzPiLJUIaAN7zhsnP6Awpkz9D4BFdI
         dNo8Pk+IlRz/vkU79iaJNgudSelb3brxHaS4wnoP2BGj+XcU7KO6wGQ2BSv5YC2H8sFY
         KTpdFUfS1lkVr4SofXA2EZXbDmFzUmPYIciNd1pl0UAeOI88WOoLNzmn2qDmkZdugZHp
         +OvoGSqC+91A5Gsl6sb+nmhWDRXK6WZV+cjLSnX01Ur+aTLr8sOMrcRx86Nra2aK8J1t
         wAdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk7qlw/vsFShXltg0HdD8cyX55Dn6tewq8VcfJ5HrPpD8cP2lAR+e6WnbKMVfaAvIlzd8NuQ1uyoqheAIdffrhsYqIvERv5dWgSzKl1AZcfgwx4eIFwfujN4vXvuJ9AMYFkUFUh0++99jxNHTrRXi+sN+ULwsFOQqeYpg1DVXMkYPXPl5kYPVyYIT1
X-Gm-Message-State: AOJu0YyyOBcf7Do5aBlhfsbxAI3khUtjlWWYHOBfzBYptVz4JTq3FX+I
	Q4P35S0D++2x+Hb2JytsKl2GphvJ31k1siHlmClMeEfZkPSipfuz
X-Google-Smtp-Source: AGHT+IFkzKy+9AeZbOpeQzkp2YulpP7jLkEFBqErOwd8SMABngm6nh1c8sOJjfkkJVerJr/Rxcf98Q==
X-Received: by 2002:adf:eac8:0:b0:363:337a:3e0 with SMTP id ffacd0b85a97d-366e325ba0cmr5812582f8f.1.1719249943875;
        Mon, 24 Jun 2024 10:25:43 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c315:5cc8:bc92:639])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481921f16sm140555005e9.41.2024.06.24.10.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 10:25:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add Watchdog Timer driver for Renesas RZ/V2H(P) SoC
Date: Mon, 24 Jun 2024 18:25:07 +0100
Message-Id: <20240624172509.106912-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add WDT support to Renesas RZ/V2H(P)
SoC.

v1->v2
- Included RB tag for binding patch
- Fixed review comments from Claudiu
- Stopped using PM runtime calls in restart handler
- Dropped rstc deassert from probe

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: watchdog: renesas,wdt: Document RZ/V2H(P) SoC
  watchdog: Add Watchdog Timer driver for RZ/V2H(P)

 .../bindings/watchdog/renesas,wdt.yaml        |  17 +-
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/rzv2h_wdt.c                  | 251 ++++++++++++++++++
 4 files changed, 276 insertions(+), 1 deletion(-)
 create mode 100644 drivers/watchdog/rzv2h_wdt.c

-- 
2.34.1


