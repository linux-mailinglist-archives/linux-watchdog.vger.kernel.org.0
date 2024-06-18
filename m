Return-Path: <linux-watchdog+bounces-1168-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E747890DF20
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Jun 2024 00:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B718B21251
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jun 2024 22:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5611849E4;
	Tue, 18 Jun 2024 22:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXroENij"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BD955E58;
	Tue, 18 Jun 2024 22:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718749469; cv=none; b=QNiUlohpfl6fy+Bx4pX3yeuqvi+N0HqyB4eIPNBdWF993b3v9VV93Kbg0SRbHInk8YcLyJB+y2VTIcEPRwyfggsyXftO6zmoAyEB5iT9zmlFEadGWL0cF4isrBsxbZsLPivk7wiz59I2ckZBs/d1qDweS6RN/0QQUhlW7t6u570=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718749469; c=relaxed/simple;
	bh=rfddAbiNc6LvjelYLHhziB8GJPZbM1bcEEGEyUjCZD4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s5bFvpTYQueNZJ6QosayQJqk0C7EH0SfsQsY1oCa99ou8tlI0dDaogOs1mlxDErPk+IKo4VmdtotS3/BZhMQdkcUoCypNg4OSmvehJIDSSbi7K7sWsIJm9zTX0PJaGC2vaNO98Vk+Nys2KIoBHJ+yCmHG6N5+CGyrJdGLVTEK8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXroENij; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3608e6d14b6so2408294f8f.0;
        Tue, 18 Jun 2024 15:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718749462; x=1719354262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qaQYpf2tHZb3zWnjXMA2cf1sQpQL7OA/tsIV6rz9HzM=;
        b=XXroENijlccGaeBQiVn6Xr6sWqpx0WtWgdnWlTJ3tXZGI3T86IzNC4DPvLXEMtjxWA
         KoQA49AN+9lx0d387AokVDgb+WhQLQPK2duAp17/i6ESnKjRjSG4tbiOmEOO2GrvSs4c
         Eng0p8FAQC9IbA0Kbpwo4fioaMtOn2OSe+3lxiS9F09HIcUm79E4D6+tAH45vvcULrWK
         xiQ/nrwTcgTG/9hF1sA0VS2t7MY8+KvGfgdaPujPOG7RnL8KAyG0u53g+0snKKUdxl1M
         3SIhjqPExkgWgfHcxmv5BubKV2BjaULo0hfudlWyYctDkhD9CAZEvbpN7kNPBhwMSBwo
         fbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718749462; x=1719354262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaQYpf2tHZb3zWnjXMA2cf1sQpQL7OA/tsIV6rz9HzM=;
        b=TLGL1eKJDtb32PRJYCPsdOYlCH9ja7JVaizIE2tKuX97SNTsAqdMA2KLl6wsNVYwsr
         5/9wyyH2yWw9n6bTqqLcM1St3DsYizU4OkRbaapn4rQUwIyLhTV6+TRX41Pk0nDFHyeR
         gglSAG5GWHPZQiRWEVRE5CyUS3I+NTj/ZldKuGCktHXdbpWjodcegV+mwArk1ejB//0C
         +Lka0m0ZG9ME7J0UoohNyqR3h4alsPEAA8AWxVaqdvA7bBPVVBHe4eyf2KZ9cNXJGX3D
         vgVV9jkJzSjrpEGP78colAoXqohMJo8ECXJdMYzvdRKQ/h2uI5BIoza7ovMSyd+Hl0AC
         2IjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6bZEyAwt+EoGYdTVsIzhu28Y/gpSbbfqcYbsqey9RdKpZ00ZiMF+Px623bUjrzwdSfr2tJ/j9cNule4FU3Ng3ExtqYpxTLh7zsfGGcm3FsOuDD1rvH53N1XGKbur4Zp1rw8u1Pxbg77hIKYkBdE3bzq05r9nRkbxLoice8wn8Gi3TbT9je0uxz53C
X-Gm-Message-State: AOJu0Yx7uzH4giuyDb7Lc5tWwFGIgqmYdTHlLd6tNDhV6z7fhec0md4J
	ikQH2yYqPobNBpZsMe576OVnQsW18JuhpN+AkPLDPiPHG5mmdtHX
X-Google-Smtp-Source: AGHT+IGLUT/zg7YNdl5DoP0IlPZNgW8nejb4MUNXm8j5fm2y15QB3MuODUhpSp+YuZme31aAK9i1Tg==
X-Received: by 2002:a05:6000:1108:b0:360:9c4f:1fe with SMTP id ffacd0b85a97d-363193c6376mr572811f8f.43.1718749461838;
        Tue, 18 Jun 2024 15:24:21 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:d6f0:b448:a40c:81a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm15189697f8f.107.2024.06.18.15.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 15:24:21 -0700 (PDT)
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add Watchdog Timer driver for Renesas RZ/V2H(P) SoC
Date: Tue, 18 Jun 2024 23:24:01 +0100
Message-Id: <20240618222403.464872-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: watchdog: renesas,wdt: Document RZ/V2H(P) SoC
  watchdog: Add Watchdog Timer driver for RZ/V2H(P)

 .../bindings/watchdog/renesas,wdt.yaml        |  17 +-
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/rzv2h_wdt.c                  | 248 ++++++++++++++++++
 4 files changed, 273 insertions(+), 1 deletion(-)
 create mode 100644 drivers/watchdog/rzv2h_wdt.c

-- 
2.34.1


