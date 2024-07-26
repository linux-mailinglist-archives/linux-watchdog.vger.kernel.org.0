Return-Path: <linux-watchdog+bounces-1429-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4818193D58F
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Jul 2024 17:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03919283B6A
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Jul 2024 15:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE9617838B;
	Fri, 26 Jul 2024 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2lWswYy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB921EA6F;
	Fri, 26 Jul 2024 15:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722006359; cv=none; b=QUw9tfEbU5VT3wfBGIDIYsPAmEAeDWiFOYUJhmmIlCx8ZKwoVkrCQCUyFJWrFYS7xfcIJQGQl/MlbiAhfeWsVzTuodTHX+CyMSFYh2ru3K/6k5TazHVSvLPiDPj+Svehz/BR/h7Lp4tiPCYqjQrPQk8pD93lknGO5mzRBnOgrAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722006359; c=relaxed/simple;
	bh=ijomKZW8jE+9m5l5lbDwqWA1plA0xObFyEntMFkqjWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4kBpgnrJaF09ZAqiPTYgOnwbIz5Fyyl5l43jggYoHUNyACBJ6UyeFltJ7S6BPBcPp6xhvWiQ3c2MhmAnxyf0BrCFVZ8XVF7af8QtnhqNsCyCqMm2d3ymXGuX11pfXO6TPK6NBPE258xaDNZWfkJDM2oGRx+CpSUl2RI5Ouu7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2lWswYy; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70d333d57cdso860761b3a.3;
        Fri, 26 Jul 2024 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722006357; x=1722611157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hGnp8p2ACwZe358GixNKJBFOLyC6zExAqsWloggrHCY=;
        b=A2lWswYygs1I918ZhEJ3MbGwb+x45ElqfiGv9tpBPZkkgiejdzKsplH/mVzKdGsXPP
         onYdpNBOaRwfrS/fLFj8FOUbLiPp428SBF2uxRJM+SwfIrfumyE6+oxidZlqN15ilcTF
         8vZPXenZdsy9PUoiLxu9Ubv3O/gNnEgj7f+mmycTzIjYUApgNgBwycD8tbambuitnccK
         rYFZzUjDbBj+weyfMMpugmEzyKqKNTBTFy4QlLvyE2Gtr2YfQ8COzTCDClIXuqCt21/f
         Q9CmAxXjOpZsKDdeKcizm9r4K1C7sxHvGNyAZfT7oWxSomIZcbH2FAVQDNbtxWR7+4/W
         l94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722006357; x=1722611157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGnp8p2ACwZe358GixNKJBFOLyC6zExAqsWloggrHCY=;
        b=XgGIf0G9KMfaIozhFfv6jmcFt0zsDJ1/NSPnLxsrRlr6uf7k21r3bdwhoH1eIQsasS
         ZSlp7vZqrCcdTc5xqcmiw7PW37ZsFRKhPerU8kyDILz3aqNYlgfa2EcL6bdmROzNCtDI
         DZbJLw8hUyJgv4ADDhYULj/a5CMwR0GBW0VaIiQEIUj0quwcicObsjtDTARRA5xUoGhd
         +CeXHExHEomqAi0/yoPHG9yDZIaxg3Ghjm8LsQpzj8EYTOC5wyO2dtTL+i+ETAQMO1JZ
         qMNpED3MLmOlkUMSdkuRfQ8PagHsUfTS67fzW7lb5PSWz1FebmHFTjGNLc+N9qSo3F2h
         J7ug==
X-Forwarded-Encrypted: i=1; AJvYcCULwpzjIDBBGAp28xyYon9bsQkkpeZttlfyvWyMlPPwd7YYD3CfPRY/k62q5PuxxT11jYB11t7p2wcUrE+pL8YIK/lNIBsswD5F4FaOCZEBFvHM69YHGMlJTs3j6B0uP8z4Ko18nkRymrOqSPA=
X-Gm-Message-State: AOJu0Yx4ViN5qaSbZaYuO6Y0Ba9B8wD+lLBo6n8Rh4Ko94ncA5pmBQ9f
	5QzJCR0lzQmz0zvVcksbs12RlmbXM44sqDVpMS1l2DU3cythqPAB
X-Google-Smtp-Source: AGHT+IFeyI5/lS8F3gDVaSnTdQU84GuKDEME56f7fy5v4tFXKDuYOkg8Irpl6/0RrDZCPA1x9A/18Q==
X-Received: by 2002:a05:6a20:7f93:b0:1c4:9397:ff98 with SMTP id adf61e73a8af0-1c493980351mr1650364637.18.1722006356741;
        Fri, 26 Jul 2024 08:05:56 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:380f:8948:e4a2:69fb:4168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7aa9b184139sm2357653a12.75.2024.07.26.08.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 08:05:56 -0700 (PDT)
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kousik Sanagavarapu <five231003@gmail.com>
Subject: [PATCH v3 0/2] ti: davinci, keystone: txt to yaml
Date: Fri, 26 Jul 2024 20:27:48 +0530
Message-ID: <20240726150537.6873-1-five231003@gmail.com>
X-Mailer: git-send-email 2.45.2.827.g557ae147e6.dirty
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert txt bindings of DaVinci Timer and DaVinci/Keystone WDT
Controller to dtschema.

v2: https://lore.kernel.org/linux-devicetree/20240725153711.16101-1-five231003@gmail.com/

Changes since v2:
- Add Reviewed-by tag on 1/2.

- Change the compatible to match the DTS on 2/2 and also mention in the
  commit msg that we are adding "power-domins" as an extra optional
  property, which was missing in txt binding.

v1: https://lore.kernel.org/linux-devicetree/20240721170840.15569-1-five231003@gmail.com/

Changes vs v1:
- Change davinci timer binding's file name to match with the compatible.
  Also add "maxItems" for interrupts.

- Change the order of compatibles in wdt controller bindings touched in
  order to match DTS.

- Drop 3/3 from v1 which might effect users and should not have been
  included in this series in the first place.

Kousik Sanagavarapu (2):
  dt-bindings: timer: ti,davinci-timer: convert to dtschema
  dt-bindings: watchdog: ti,davinci-wdt: convert to dtschema

 .../bindings/timer/ti,da830-timer.yaml        | 68 +++++++++++++++++++
 .../bindings/timer/ti,davinci-timer.txt       | 37 ----------
 .../bindings/watchdog/davinci-wdt.txt         | 24 -------
 .../bindings/watchdog/ti,davinci-wdt.yaml     | 55 +++++++++++++++
 4 files changed, 123 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ti,da830-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml

-- 
2.45.2.827.g557ae147e6.dirty


