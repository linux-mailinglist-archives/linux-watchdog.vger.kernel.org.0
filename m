Return-Path: <linux-watchdog+bounces-4804-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF82BD15A9A
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 23:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5803930CF135
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 22:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004E5340DB2;
	Mon, 12 Jan 2026 22:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nk4EeUf1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B2dQibkj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0D328C866
	for <linux-watchdog@vger.kernel.org>; Mon, 12 Jan 2026 22:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258153; cv=none; b=rFUNtIwaK0QE0mTkKlDrX5yk6rjX3k6u07lx1gPUgJ+Du6Pyjova3IW73JSAUYtKQZ+XZCWfxeXjQfJ6GP8UlgDfcv1NRRCoWo5sNo65qb95T+PyiFO/zMJoEGToGFZS/Hq2K9GSrod19F6G2P9Rt1zs2VfQtW3GGvrMlAkQev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258153; c=relaxed/simple;
	bh=+CeBdqNkhTo0Vz7mLS7Hz0nmrzj1DD3v7IFsU0i6AJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zwaez0Q0SjPkfYFZScyGtDRP/UnbIf8/wqYUBpUTWu3nwignJQax3bdm+opbKSFy89nH+8HIH4nMhZsVGqy7dKeCo7jRFdJoGT/aDeQ879prmbb4OcAyofvVcJmYg3qhLjgzKqQlPXNyIcAXR8QIyKWnBKwJoCH8P7vdcJA4noo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nk4EeUf1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B2dQibkj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kq817KTqUgty31Jw4OUgrwYkI9qQGz93n4JioGYSdIA=;
	b=Nk4EeUf10QPEECd95xvWKGjNP40gNL4nIi0wAFDXrsWGYwdhfavoOoTwci1BrlE+2DxiG9
	oW4DOZE2InGj+5cgcgUew5mrJIrz7pJIS10cdrjMySqknEdFtHyBmBIUqVXGp+yhBguX+G
	R5jf6zYQJzeny99n4Z9b4jHCptmm/RI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-ySBJ0wjJOFmRVwHUkC0iiA-1; Mon, 12 Jan 2026 17:49:09 -0500
X-MC-Unique: ySBJ0wjJOFmRVwHUkC0iiA-1
X-Mimecast-MFC-AGG-ID: ySBJ0wjJOFmRVwHUkC0iiA_1768258149
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c277fe676eso2079700585a.0
        for <linux-watchdog@vger.kernel.org>; Mon, 12 Jan 2026 14:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258149; x=1768862949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kq817KTqUgty31Jw4OUgrwYkI9qQGz93n4JioGYSdIA=;
        b=B2dQibkjLmQSIXiD8CQ6udy+AxGIfMuvRMoeM/bsXzIjT0jtelwY+J5twtCQfM14pY
         y2QrcQnFqsW/eDATpqiWtVtDpOg6S9ZX4PjTLzhpSyqOENO5AgTuKiiSpoS3sM/GhZcC
         AU2fLlk/fJyjnMxsq5p/Ogq+sO/WlIfMQHAm6jSSw8U7vwt37RSh60HCLogp954ydGvT
         uoRcMSAaBumY5UKujCpPSzgVjkUehsWwJAjRLPYzva+yjuhnzSzc4OM69zBbOw1W5/nS
         wSc1/eN+qq2FdIh8CJoO8l2UU/Gu+98fkOOiUdyG0fpUDAUrsoMGs17I7RbTD8cuqILF
         ZD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258149; x=1768862949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kq817KTqUgty31Jw4OUgrwYkI9qQGz93n4JioGYSdIA=;
        b=sivEJ+qEf3M/1xVkM/Zd1NfFiLOYBtsRGYJR4MEFxya94coVubi6Oin5rq2JSH24AI
         ZtpODU6ayV5HjWB6b7fSJxNjQvHRckT8+xb154kIokR1+pobBgohakJCGBT2DnJzqTHp
         OQCdBD6HtY4k00EewvgeTOkQvCq0TH5RaiG/DANK+m8yi8n99MVF5sJS2GaABwXFjFIU
         52Ei3Q/C+kOFHsg99U1GNH+YKqiyAvCeh8yYiVVgNzl8QZJHzJu0Hc2PMSLTydHab9Fr
         MC5JlHa9vQ+5XnlySD10U+cpBPXv4NEOjb5Re8s3jJxb5ZaRlGeieyjDLHgfO9LZK/ii
         WWlA==
X-Forwarded-Encrypted: i=1; AJvYcCWFf+OTC346z68yFM3ecZFKUR4tvyPYRTtTwaiZ98x01pFxB1qIq35DWDdfR8Xu1kXyby2zv480Hhrx6MtXDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIo7gAFOfrB3UkZaoqR0W/fcr5paK89W0Wu4xqR1vBZ0Okqdbd
	JgZ5eatxe1Rojup8mflHzxNmC1EEMog6F4wlwahN2KcR7CccFq1DFVrWCxj3X8fxjzv+s3/XYD4
	1V8HGFfFG5VT+4ua/3I1MpLXywrsfpjINJlb75thcwziIZEGgnKxX0ub3wKJaUhv3N25ZH8X3a/
	OK
X-Gm-Gg: AY/fxX7GGjvnLsXN/i1nL4Yibm1UTjVXlnFKdcOZtVDUlas0hbG918Pm6qhCVAiRPwz
	wZeTWFNdNMhoXZNI32b/YbdbetOBBzcvFZQP52y6Vb1NhcSYySmL5Sz/N3WRp6eMKgSuFL9hfk7
	Z7SeIdfps0cEibQ5SEiXLwCIuEhupGkOOO09a/CyPD6gKjTBeY6MoKdd+ThFKRIjZuZguM7E8/6
	IARgZHgdErfImNra6SXTaKkjY0aQBTkG6XmWiBJoLI3O/pZzYpBDR14MWlMZaHjDUGwbN+2AgpG
	OFeGYgifJJt/pfeXzbQrWkUdwxCqi3hmVu18cXPj5WZ0KeGoOLxca+bAlYO0egWwnqDJfyEdqFZ
	+8NXjLnegO/epOP+RZQsaNZZ3TU/2Pzqx0TqrMaf+Y27JQhfPBw==
X-Received: by 2002:a05:620a:6914:b0:8c3:6692:1f03 with SMTP id af79cd13be357-8c389433cd8mr2608116885a.81.1768258149329;
        Mon, 12 Jan 2026 14:49:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGYmM7hQdX8Bi4+xsGFjdc9uCq2IsPbJWi6gD0R550vN1IswNtRG+t+9zu8an4goEKWmgTYA==
X-Received: by 2002:a05:620a:6914:b0:8c3:6692:1f03 with SMTP id af79cd13be357-8c389433cd8mr2608114385a.81.1768258148958;
        Mon, 12 Jan 2026 14:49:08 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:49:08 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:08 -0500
Subject: [PATCH v2 14/16] watchdog: pic32-wdt: update include to use
 pic32.h from platform_data
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-14-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Guenter Roeck <linux@roeck-us.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+CeBdqNkhTo0Vz7mLS7Hz0nmrzj1DD3v7IFsU0i6AJY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq3wYfpdGrjjFGvBKX8Dksb5Z7YaFlidSX1fVZPc9N
 Prb3vG8o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQ3h4hSAifDlMPzh3vy7U7ej7NM9zt9q
 fzndUs7UvZvasXgyR9IU/UKhuBduDP8jGNgzBEpY5JaYvny8IrW7/eP+O/nrtY64PNa9yu3FupI
 DAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/pic32-wdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/pic32-wdt.c b/drivers/watchdog/pic32-wdt.c
index 1d282de312ef1bd683529088fc88456983e8efb9..2e7186b85194645d40f32e69f198514fca83b601 100644
--- a/drivers/watchdog/pic32-wdt.c
+++ b/drivers/watchdog/pic32-wdt.c
@@ -12,12 +12,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/watchdog.h>
 
-#include <asm/mach-pic32/pic32.h>
-
 /* Watchdog Timer Registers */
 #define WDTCON_REG		0x00
 

-- 
2.52.0


