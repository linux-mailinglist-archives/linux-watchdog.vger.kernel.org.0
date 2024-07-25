Return-Path: <linux-watchdog+bounces-1423-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9788393C68F
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jul 2024 17:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53D6E282766
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jul 2024 15:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0006C19D067;
	Thu, 25 Jul 2024 15:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJIAL/pq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E7626281;
	Thu, 25 Jul 2024 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721921851; cv=none; b=oqQeoMYQhENwpUVNf5aFzOVMcese6unaG2MaBbGUn7gOoQUKFDfY5iW4yOJiYkV5OO6JpZig26JQ8mT0q9COTV+258K/EJJkJEU/JjwFWz8yVha/EwgMqrmGhhj2EMNPlcn1CG23UVbwxcrsdw0V4T1peKMRV0edVVoBdeU3H4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721921851; c=relaxed/simple;
	bh=/n1Atm57G9O6shSYbXoTXtiSyztvvlrIo7zuTgBSym8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvgLzWqUuLOtnu5IO1kzoFTxGAXaE4fbtgCrLSO7WnFSRK9ETDXVEDr8lgfIZ+Pwgj6D7bMvJTf8XhanHeRdz5yPQ1ys3P3iSyWMWQau+vEmUnvBHTwCnALrqjOCMFhDSDeBin5zdvIVgeaJfuckn4ygXpJaZY4NE/sPeZmkJUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJIAL/pq; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70d2e68f5a8so814831b3a.3;
        Thu, 25 Jul 2024 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721921850; x=1722526650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n31QORMfNE3yoo2+NSX27M5mqLxkfeiPRY8j0VlreVA=;
        b=bJIAL/pqIlK9778RYAUbDHh2qgWXPmx8nlifERoxXdV0ww2gk3KY42oeUgX4+lo4UA
         1zVJzwJuhVpH6RxNwVgl2t2NvhTxCoi40k18Pe8wf7h/FIa0M9lsctE6FXRuJzd1E9ZG
         jhpuGy2AsfZMnYm+AOoL4jsHJSt/SHrxj0EvJ/9HXuWs1UutpNlsUCq0qosLWz4F7wu5
         R+KRt0WvIG1ZyIX6HLd/eqhmd5TM66qVbImY172Dgy00RRJYkMy/3qENZUNExJDLKssd
         2y+BWaa8C1HDkVnFk9d9uKVyjxj4IKePplpsOvXqcS299rTkeXKNzjOhg90PQacnjXS4
         Hi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721921850; x=1722526650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n31QORMfNE3yoo2+NSX27M5mqLxkfeiPRY8j0VlreVA=;
        b=b7bn5YWuz8gUCEOpRLpi/aRj00+V5U7KjDh6V1TPDxMic8XSQmH7BNGv7LocSeAFwt
         6f19v8Y+S9f5JSYHlks4bmLgy6sTjDc4SObgf7EMyJDPFU8dq9pwY/pCskiN3h3WIN6M
         8q3NItkGHzcWigZUs+35/OqVH4Jkt18cjMzlcFBhJdo8NXHoVstEaLwl/HosCEZXQlrX
         LaIGUc3PBuIukGwOQ1gutQK0ZvrpkQNsLoYVL/KtxZ7SjEDsqnOSo5DpBhr7dZ3wCvKS
         eOJPgtUuebv3PhuqmYSKMGLjlfQHIYHawOCv4ly58WD0XgT0uOixloauJjkI7ACtqwnm
         puzw==
X-Forwarded-Encrypted: i=1; AJvYcCWyyuQrqbKm7ly1huX0UVRMTf/WG4/oGoASEYvIxoeYG8SO9TsYd6E5zuTjakRyr9bYaK7hAW4SkYv1R4D0X5uNQ3mIKmtP/coiUmMMvoH0oU6kDw1Reb6ddmU9LM/TtsEyKzo8h7l5UmYer5A=
X-Gm-Message-State: AOJu0YyZbOzM6poPyINNYB/Dwy3u17VDZjg30Fz0kxjB009VQIDU09ax
	RYlH5SAW6upXzC7xvIeCI/QIYdwfMlhMpWOs4+lvshrWJ9TLH5QN
X-Google-Smtp-Source: AGHT+IHyopklPWWOH9v4gmeeKYcsv7eHQMUjPDIU7eRRYcDOql08gKbqmBXmg8h/XYLe3mFlGWRPTQ==
X-Received: by 2002:a05:6a00:1ac7:b0:705:97b3:4605 with SMTP id d2e1a72fcca58-70eae98fd23mr2782223b3a.25.1721921849671;
        Thu, 25 Jul 2024 08:37:29 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:380f:2afe:8fe2:1930:3917])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead712bf0sm1270369b3a.74.2024.07.25.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 08:37:29 -0700 (PDT)
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
Subject: [PATCH v2 0/2] ti: davinci, keystone: txt to yaml
Date: Thu, 25 Jul 2024 20:33:10 +0530
Message-ID: <20240725153711.16101-1-five231003@gmail.com>
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
 .../bindings/watchdog/ti,davinci-wdt.yaml     | 52 ++++++++++++++
 4 files changed, 120 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ti,da830-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml

-- 
2.45.2.827.g557ae147e6.dirty


