Return-Path: <linux-watchdog+bounces-2525-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4421E9EB4C7
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 16:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C58A7286233
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 15:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1A21BBBC5;
	Tue, 10 Dec 2024 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4ynxH6Q"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDD71BCA0F;
	Tue, 10 Dec 2024 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844302; cv=none; b=QcBcWF2CgFXpjBaIINPscwWlpsVOYhHixRbGMOqKBKSYHm/H2MOCzgccI0WXi2t0nbcY9GYxeIJMXBrjYO904+Saft2nvFPlblG2rvGqvoIkHT/ZOvTtpZDYlABe2SYuWhd59Wlbh4Se2a0VQEYk+R70fBfhRMti/etQ8iJnpqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844302; c=relaxed/simple;
	bh=dB14mL1JWjUZDzMD365my4ilg2hXCMkzNrJ5KLtj5Ho=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qoiU9OMfHJt+R+NV3TudEtLisfpQBJPovMG2kTMUr9l7luTGtMHE66J27jU5q8b75fRCAL5fTLLhotnyMqYU67cvXtbxuWizVxAt5e8S+L8FK76spacRZcNW9YXw9LbcCE5QsZiN9/mhkdeidksi5/SmDEnz4LkN47fhxZgAK3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4ynxH6Q; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401b7f7141so2211542e87.1;
        Tue, 10 Dec 2024 07:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733844298; x=1734449098; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BKFT1vBScPQws+xOKZ4hcz+hyEqpCfo8AxNCBOKed0=;
        b=T4ynxH6QqORR0BBqQ0VnfskESMlRbpC+Wb2ZNkagntDgSxOUR7TLgyMMx0aDKVHah8
         IT4n/rwtrs01R1NxjaOyyW9698D9L+/R9ZAbPe1QLVr0P6ivjKwTRQ+R0pYq209fuW6V
         KBJ9K2sGr5S0McOf/nEvR4EPxeyI0HZLuFa4RyY+hdvbyy47oi4eI5mrR8tu9OvgIc0W
         7Nh4vGE4jQnEQx594B88n7UBNmlo1uTEtmq8Z3JsDpRwl3vQEG8IWOY58J9pfmMyXfZI
         JOk8bAXIq/RJh3NpsYgqS8RTjAsrd20LZvDQ6AgYi0aTpDvvSdWFr/E0WQVhGpDc5ybw
         VmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844298; x=1734449098;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BKFT1vBScPQws+xOKZ4hcz+hyEqpCfo8AxNCBOKed0=;
        b=NZH/RcB7gO5+mSqwYoxa8kAmVQw9VmBCE2cKWBmj3+v9eXPFZtITiIN6I4kzyt0mDd
         9eCD+8cixbg318TUr1ZYa/BhF5dV16R7fW7D714apSua6RGypYro7+jk6O2WHxiO1ewC
         gnwsPWgDtwbNWUfJ1zmMM5VE0Occsf+8WKHMGY4vsq/ZpBfcyXkJZF8zmTOmXKRIH5eC
         +AlSuRQE/PhzFyglPTkU2wRJ71gEs6NALr07z5a6dp4nf+ARyvmR12QAiktKHP29W3jc
         NSm8RrL8OStn36cfJHFW8QIPWEznsMFLlql8XrqmBVCu5SDC2Cl2Q9ETBCE0TCGWt2iY
         EQVA==
X-Forwarded-Encrypted: i=1; AJvYcCW0D0dlPt4+yVyZs/Q1PSOChb9+X/0S+fDb4gcck8vRRwgTk5R3CGmeH/eyqWiWNyPzisHw8CssDKbXNljgQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7aYrJ5+ykm80tSO9sFP2s4xQRi2tR51P3xBqvnBS0H1yXPeHb
	4EzJ30qhDsmjbXa4PicPx9aMX3RkQhEePXJB8ss4aDHbue0KFUGA/ZSyt2No
X-Gm-Gg: ASbGnctL1/VyPT0HYkGPUTVw40s1ZptL+MjlrsJyevlaQVIzEaBWaSf75k8+/h+JVqd
	PkYvcprfWfgmjd9lxzGisoIal4ayy+/z580VW44Ae4Te9U/6qyj11ogE/tDUB+Cpmk54+gr9neX
	CZ/E9JimKn1x9yi5+2BEdEMYv5DWcptbQfHNHL5QFvHZl0piTbQG/5e/TrZkaX9SCJV6ursJZV2
	Zw6LZE7WziR3vEjC6F5kv11cyTc/WNWdH8Oa/kJIjTZBpfDv+G2RsnbpAk77pSbGz/oDa3vatMn
	GWhmu+f6WOvspCb1CMQ=
X-Google-Smtp-Source: AGHT+IGdHs8olou1npVdwkHGsf8YGyqjUpqiHiaFw2qERWkyWMSm5avDnXb+0r5QO9vULIvhk95y4A==
X-Received: by 2002:a05:6512:32c8:b0:53a:1a81:f006 with SMTP id 2adb3069b0e04-53e2c2c257amr6504126e87.31.1733844298290;
        Tue, 10 Dec 2024 07:24:58 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e39375d36sm1254397e87.7.2024.12.10.07.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:24:57 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 0/2] DA9052 boot status
Date: Tue, 10 Dec 2024 16:24:39 +0100
Message-Id: <20241210-da9052-wdt-v2-0-95a5756e9ac8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADddWGcC/23MSw7CIBSF4a00dywGrlDAkfswHZCC7U3sI9Cgp
 mHvYscOv5Ocf4cUIoUE12aHGDIlWuYKPDXQj24eAiNfDchRChSceWe5QvbyG3PayovTUlmjoR7
 WGB70PmL3rnqktC3xc7Sz+K1/M1mwao5t4EKZ1pjbMDl6nvtlgq6U8gVsUuKApAAAAA==
X-Change-ID: 20241210-da9052-wdt-a7943a745987
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=dB14mL1JWjUZDzMD365my4ilg2hXCMkzNrJ5KLtj5Ho=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnWF05VtCk5nMkoOwTITv7xsEP+yFsQFH5gxfcx
 3IJYP5JCTqJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1hdOQAKCRCIgE5vWV1S
 Mt7WD/wJny82NFoJ0jU/uDHQ9NXwtxs3RMZTnMQPC87yrO/f7XUB9hbTPNMn2XyGFzcCGVYLJaF
 Lq+3XknvmLEjYdlEWJYu077RI+VfbBnRtS/qlID/VPNCiib/eWSld+tsz2kfHFml+qrKfB71reu
 wkIYHFM6HBUZX4NYZyi9/NNQ2shzLHCfzau5e9qdCDV9OZApQvz9pBY+z/QrEWLLa3wsebGTCZu
 GYU5Ut+MTZXwlsBxwmIkedmTm6JHEin9de78OW+KV2bz0xAa0jTKiZo2btlRiWp+Y6DARCR5ZAC
 jwOd1Pp7nDdJu4+oFWt0Njj+8lnZc9EU9IaxAt1yzvKrU/vG8hZFg08RvRkCyUFHup3zj3H5wTe
 Xa1DxUd9iX7REjA40cEfc1VBb3KSPQ4DKNV3Zhjc0rG1uDCzkqoaKbl7ou8ffiV2xag58QDVoIX
 +Q4pZcI/6/f7qyu3X4wMSaUjJpm4uUpAx+uJNqc6PY5tGt/lo8o0efLKPC5aUinjttHqLJG7f9L
 f4O/ePryLCfrQW3FXfPBcdnUPRKs8UN0OwF/N9rAHReOU2njgBHWSwsjvy2OdgV1rexKHf1uxng
 zgTZqbq0RZcJ7m7sFMI1F5oED/GipACGuNjMaj6owytEsQg1GayBpyXNsERzBof3o53KE4kDc8a
 5bgk5ZqhOMDEvxw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Make it possible to read out the boot status from the da9052-wdt driver.

Function verified with `wdctl`.

root@mfoc:~# wdctl  /dev/watchdog1
Device:        /dev/watchdog1
Identity:      DA9052 Watchdog [version 0]
Timeout:        4 seconds
Pre-timeout:    0 seconds
FLAG           DESCRIPTION                   STATUS BOOT-STATUS
CARDRESET      Card previously reset the CPU      1           1
KEEPALIVEPING  Keep alive ping reply              1           0
OVERHEAT       Reset due to CPU overheat          0           0
POWERUNDER     Power bad/power fault              0           0
SETTIMEOUT     Set timeout (in seconds)           0           0

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v2:
- Simplify assignment of fault_log. Why complicate things...
- Link to v1: https://lore.kernel.org/r/20241210-da9052-wdt-v1-0-d026e0158688@gmail.com

---
Marcus Folkesson (2):
      mfd: da9052: store result from fault_log
      watchdog: da9052_wdt: add support for bootstatus bits

 drivers/mfd/da9052-core.c         |  1 +
 drivers/watchdog/da9052_wdt.c     | 13 ++++++++++++-
 include/linux/mfd/da9052/da9052.h |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: cdd30ebb1b9f36159d66f088b61aee264e649d7a
change-id: 20241210-da9052-wdt-a7943a745987

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


