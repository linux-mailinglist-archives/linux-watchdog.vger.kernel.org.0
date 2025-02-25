Return-Path: <linux-watchdog+bounces-3006-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A534BA44317
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 15:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6CCD7A3166
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 14:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2DA26E17D;
	Tue, 25 Feb 2025 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BW06Z4Zv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDCE38DEC;
	Tue, 25 Feb 2025 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494217; cv=none; b=FPOYI9Kc+i7fOx07mVYXr4eFcxapTYbwX5RkPb5OqLj2HnwDgNR3V/gFLdlDBfgIAwEltXZdU2/zRAbe+Rox7k/9oINQNOnZbV9tbLIWKdXHlXOuo9ooOCOwY+U0+eCw2PgEtU+2qqbiZ1Gb1PaVvIjA3PqsrQ11kOHlUql2++Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494217; c=relaxed/simple;
	bh=GIMdMLj6BbS/txxma/JVtTFZH3g2DvEeT4hV4F/TP48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=J70bC68qQwhKKk3nzHsJX7GDWnGpNNs5As7Q6qB8KV7gWpE1QbZH2khqkN6VPwBbAIwOnTM3XW6T/doMIz6FemvTWIIaCwbSMp0ijGc0jl6kjLBbB75++sQ9y4sMtWThb10oImCcW9mKPNISZzXzk0v+00XCdFUP+xuHLwJ7HzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BW06Z4Zv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43994ef3872so34893955e9.2;
        Tue, 25 Feb 2025 06:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494213; x=1741099013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwiobQ+ov2NGgIChlOLIJyU8mL2VZ/8aCAPBJC6i4xg=;
        b=BW06Z4Zvo06ID70Awo/w//Ebx9mTy2rQnKtB21SWJVzIoLRDOqaRhbB4oWmUQ57vN3
         9SjnMBOS7Spr8pb1NxHFiQpKd+34Ysb+Ji0LP+goyuZwl5IkGldXMQP5dH/PcBJEpwrM
         SzCu5RR3iNUi86jFsrsQJbbCTUhZ8dHm/cgVm+yiwwGoiul5uWtqiiUbSnlAZEg6LOy7
         pkUX1nXpsxF51kp420r9hLA5+47HRryFb/nKzKN5ZeEUA1TNY23sOHATIg94CP9RkNlX
         n7oDgukuiyXl9N7npgRiBg88RgRLCImz67+afHhkSxnkEm2+JFr4RaC2spI8P6tFONFM
         iAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494213; x=1741099013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwiobQ+ov2NGgIChlOLIJyU8mL2VZ/8aCAPBJC6i4xg=;
        b=FGmmK1LF5PAceljNpmnl5DvemXSmDFahTb4YE0OMc9QJ+9LIbXfts8DM5dTcUMzcfr
         lCc0mZtLG/4/GRqA9xZ9LNReJZvfCeBPsHeDVW9Ap7v2mP6zXOiORPdkkOaGwUNx9gex
         Uv1wDQgt9bCpB3URAFScZcIbgP0B+XpddVeUGr/ZPZQgV9HK8aEztNzEp+wC/Uqa+C2X
         7MEevCR6W70iN5R7gCOCBsCgHY+RoOI6iY5heuS5Qxgx8t3lsOkD0plJHfObGa37zrXp
         Y1oZIqPv/svZAvgzpGOJhKHpiJK/M1HHNPd4Nh1ITSKB8sDL5DZBC1fvrkXYtgRPrgvP
         xhmw==
X-Forwarded-Encrypted: i=1; AJvYcCWPvVxMokleBjH1WRiitX3HsygnwTgUU3ECvSc6Irwmdcw91LpzjsnrV3keFrEyRa+Sx1yEAX8qaVLzPKs=@vger.kernel.org, AJvYcCXGq00qlOChta6wqOeYiVD/TAL9Hrhnn0/JXfVWpkiWX+cASYNUHUmRozqEytFBSITcDZ/7Q9g8xgXJ6mNzZKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXSXkkfyUIxogOlUKXZ8mgi9irB26hWR35qTV85BwhW9e+reA
	7gV6syKVhoe87O6YyJwRJx38x9Elp3JyV1XY0Me5Vg0DtOyV4Gdb
X-Gm-Gg: ASbGncvLSckYMqJNVm1a7fXjdUS4etwKN5AA9rDicwHecAeiLx3prMXdhfOGaR2/F/q
	vZcNJtrktCUQCtmPnjJyekRuroOqZwkWzMbSbrS7xh6rB4k+6W7sWklP+w5LNwKhNAaJdPgN86t
	iV3xOaclNHdHraaSffkEGLAq86xesiaT/J2uDf1jFIfKGk9F4BfhSaNIpPIw3FJ2erBYuXZSBZh
	Ecrwanpy8tz+S7F+3E26b7o3jG7ZczAItKxS5KhHb3gNIl/i1sMm484HgJJSuk2U+awvLW7cIz+
	rhbHYU1BCBc4gUhbUNuxjD/iyU+PodMK/G5Yhuv9XQcbU8zv8cMLOyGn3eBQIQk=
X-Google-Smtp-Source: AGHT+IHqYyNIhjlrYWJKlXkPU9c+6qRV/sFcYlFP3Oo19VLSLbGLfo17beLiyZrjDoc/9WsbiQBXqQ==
X-Received: by 2002:a05:600c:35cb:b0:439:942c:c1cd with SMTP id 5b1f17b1804b1-43ab0f41698mr32827425e9.15.1740494212733;
        Tue, 25 Feb 2025 06:36:52 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8829cesm2474493f8f.49.2025.02.25.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:36:52 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: 
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] watchdog: sunxi_wdt: Allow watchdog to remain enabled after probe
Date: Tue, 25 Feb 2025 15:36:37 +0100
Message-Id: <20250225143638.1989755-1-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

V3 of the patch allowing sunxi watchdog to remain enabled after probe.
This 3rd version is mainly about code cleanup.

Best regards,
Regis

Jernej Škrabec:
  I wouldn't add checks on CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED here.
  My understanding is that this config is already managed in the generic
  watchdog part, as long as the WDOG_HW_RUNNING bit matches the actual
  state of the HW watchdog timer.
  I only saw one reference in a HW driver, stm32_iwdg, where they cannot
  read the watchdog state, so they start it and set the WDOG_HW_RUNNING
  bit so that both match.



