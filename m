Return-Path: <linux-watchdog+bounces-3591-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFEAAC7226
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 May 2025 22:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 497464E34E7
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 May 2025 20:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA084221F04;
	Wed, 28 May 2025 20:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wu70i/MV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B072220F52
	for <linux-watchdog@vger.kernel.org>; Wed, 28 May 2025 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463753; cv=none; b=m9YSYyvgHL9YuyDmO5iEXOQuQkP39is0if6rPIXcQEkPywepaSOoPsb4Jf50iZDc//IcmpSd/MUFn2FCGW3Sk3jHTM+fib+SLqGxcyKg5+2teepaiwwfK59ZJGZYl5YmrkRXHU3+Bcb4MPVmddXV1CWBd0Y6l7+z9eiK0bzQW8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463753; c=relaxed/simple;
	bh=yjstY6rXEpYFD0+RmP7Mw5VcbzLqQWKymqkM+58/TWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWagbZWXbzuoi7TJFztzl12X/y8/oS7AQF+aYy+RTafL5r++ONDEYNQbFg/aNRo/EgGVvSUE39a8qG9d2LuQmN6KAqrvuF7gKHZzZIwbQQz9SJti4+EPpUhz+WASyuTx7TzVW0FNJ2Cu1yXccz0EHN9Xek5rxnKDN1GxGKebFjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wu70i/MV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4d877dfb3so213038f8f.1
        for <linux-watchdog@vger.kernel.org>; Wed, 28 May 2025 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748463749; x=1749068549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N+GSbJtN0YTSTL+bpD4kJB+1zO1bOLCqaQRg1wG/P7Q=;
        b=wu70i/MVMRvUlp1kAQV4dB16ZynTNbiqaKs+SrB4FIJsyX9gr0+8RgxGvWRnK5tX4R
         K3SWFLFvDZ1T/PDHXN6AIK5wJOIzZ0/yEyqgqjUWmoQkljVEfT9kL4xtfyo+4oW3Bnpy
         ysxUnC4U/ubHqdChoOLKteUKz13I6dwXKgthtrlTB7G1jpOxw59e1AEAOTQOaSTusBkl
         TcAVfz349mcTjgam82+zlGOjWAAdBu3JeX7ojjCrbwVCrRgNqOjrYPVCO8K/hm2QwbuG
         rlXMwwOzk7eb9MI+hVYftsGz9tCGofbWnigJZ/fUdXnyvXoaPLunGDV/m2V7tUfbtk0y
         6d7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748463749; x=1749068549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+GSbJtN0YTSTL+bpD4kJB+1zO1bOLCqaQRg1wG/P7Q=;
        b=QByREtlOC1+1N6wD2C65SDRJ61HivFhsHcM6Zafv+Y4CysW9D2FaAceNUo5MK2wc7r
         7VYjDHLfNpr/VktgkB7GDvRSgEf8S0eN3NlsmuHzF2LFMBNBp85Upsr+ARxbxPJ6vrlc
         oJ64aP4mZ6keqvtENFTfGIzLX56uGHigqsaocygIEayXVj7lsVN0ax3HtTdN5D7C7ast
         tDyk3GUpDPnkYku/zOv5+7iYgl5UjTIPCFTujULTgYGoIx/zp2h0FZRSEqAwqr3jS5U4
         QzZZw9OEpog5hm+DBDiWJg6WIgmGcapOQuBRJVZYiROTbqx7fRcHVuJIPhvTffGsimUI
         1mDw==
X-Forwarded-Encrypted: i=1; AJvYcCXsEXDtjV4DHtn/mV652lK0djJ6eRIPos07iYEzG5IO7Rkd6qSdkL2t+D3g7kqJntrG+oQs+v5X9LTUuIh1tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznD9EYVStuKdxcMQikCEv13sMhQMCjAybcYpPYNwSrpJ7albqB
	72nGsJRM9CPqGJKONk5JkYi2sjPW+r5vwahj6ddw6vy8Jh9Nhd6YJOilIL8Pi/OpJ9o=
X-Gm-Gg: ASbGncv5bBQjN70YX0INOyUmLG1tnRuArZbi+wZzXQWDUzZ1Exf8pQJagxqSYwvO85a
	B0Mgryy60Pn0nD/lj2kthGr1xuhesvuyUH0+OFaAxkYroHA2H4fUmuZUNSxRgVfKLnOB5Q+BT/k
	a5LE3AIl6h2Hms+yYv8iybBBhTpD63qoc+RK5art5Twd6KjtDgrLfkHVqGOC+oK2VTPPwEbm0VM
	s46t1OwbtQYtNl45BBN0cDHf899AZDeFgPn2kt+kSjtfl7s8uUAO9qn0uNtDPOmV/aUc7E1PurB
	NOKRamJy5T4wA4aRdXtMfGMh9c4dmee6ZJ6XQMZlYSzDD7tpw8xZW/4=
X-Google-Smtp-Source: AGHT+IHvy1r6OZs5sU4LLXUI0yWkVLTSuuPl8W2UXljyyd/AXSg0+qU0wKujDqcSxYJO0fbZol0FVQ==
X-Received: by 2002:a05:6000:26c9:b0:3a4:de01:f8dd with SMTP id ffacd0b85a97d-3a4de01fa09mr8765641f8f.2.1748463749231;
        Wed, 28 May 2025 13:22:29 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eace367asm2409656f8f.95.2025.05.28.13.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:22:27 -0700 (PDT)
Date: Wed, 28 May 2025 23:22:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] watchdog: ziirave_wdt: check record length in
 ziirave_firm_verify()
Message-ID: <3b58b453f0faa8b968c90523f52c11908b56c346.1748463049.git.dan.carpenter@linaro.org>
References: <cover.1748463049.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748463049.git.dan.carpenter@linaro.org>

The "rec->len" value comes from the firmware.  We generally do
trust firmware, but it's always better to double check.  If
the length value is too large it would lead to memory corruption
when we set "data[i] = ret;"

Fixes: 217209db0204 ("watchdog: ziirave_wdt: Add support to upload the firmware.")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/watchdog/ziirave_wdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index fcc1ba02e75b..5c6e3fa001d8 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -302,6 +302,9 @@ static int ziirave_firm_verify(struct watchdog_device *wdd,
 		const u16 len = be16_to_cpu(rec->len);
 		const u32 addr = be32_to_cpu(rec->addr);
 
+		if (len > sizeof(data))
+			return -EINVAL;
+
 		if (ziirave_firm_addr_readonly(addr))
 			continue;
 
-- 
2.47.2


