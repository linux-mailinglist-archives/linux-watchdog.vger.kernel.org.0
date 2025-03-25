Return-Path: <linux-watchdog+bounces-3133-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 105DEA6EA7E
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 08:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 388323B5AA2
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 07:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3861254870;
	Tue, 25 Mar 2025 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uo/iWcXv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA54C254858;
	Tue, 25 Mar 2025 07:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742887677; cv=none; b=UTbE0izwhYM2L9wMN19libcX0PkS6V1yKsSFaaBD3UB8nAtRSTl7EYOSJapEUXCXyLODtWiZJihuQTC7NJYpnvIxI+j9ch4/T/AzFmTdioTbkAe/m2ZoID36Tv0URhcrVahH9C4mSnSoQ47zVHCUfs4TzlCKyCT5OBcUaxiaxEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742887677; c=relaxed/simple;
	bh=cKLX0CYGXCgbuT+agxT2tRVi4WrqxSVTWlH3Cy35LjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=daabElaaa9fjvW5wndHKX/JO3gdsRyGGz5VBEFYzPXJZDu3A/+BqoWdvuYyPujFm2odhX9Q63HYnuMwrmdJaoysHPicTow/tOh7bdJ6IaN2+oGcqNZwSja7oNvV78KOrLVvKQrDPLWCrq8r1fEPyl0qBY1Ot8XxUay95XsNZaCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uo/iWcXv; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30c05fd126cso46895871fa.3;
        Tue, 25 Mar 2025 00:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742887674; x=1743492474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoaaHsdPl+I4arazHsglZMZw2PNB+dtojddpnNQGJNc=;
        b=Uo/iWcXvBcYr5bJAQAD8dFOjiRO2X85FQ4XupKJJL5qDQ85oMOzPCGRNJsTaOlcycf
         dVcyQLimGJ7uEdU7oRnfjaODwY0Vyt9nvjVp4vS5j6XmFHOjWOU5xyu5xhZMNT/bwU3j
         JP3uR0JWrPcHHkgemW02ZJFRsJSJEDugIAjwH4MddvN6knRW0wgMMj79GW8It0WVQQgH
         yLUVCz9Elnl0vRQcGzZR3VhdvS2M6oXt8KMZVO4VIBPkaplePUef6ngfGwbCA2kQVjFK
         6A5HRboghFm9DTRXWKQGxeUJl8n1DTA1u7SVLIiwYGfOnrMZwTfDc2LKzU7PD5KVRoJF
         s/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742887674; x=1743492474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoaaHsdPl+I4arazHsglZMZw2PNB+dtojddpnNQGJNc=;
        b=sIycUX8DbPA6rKdl0l1El4PrgH7vdb9kznI4whThEVzPXNEHpLVMR4i9XGBPC67Gsg
         sOolIptPrewMSSub9Z7+Hi2Evr9UuFWMdUHypVdGkzef6SwlmLmGWSv6c3U+WpTSbZDD
         t4wI1AtbQKiDIBuzt5dyG9S2HYvrrfiLCbrJXYiM1xhThL2+IWz2hq6T8HzpZmy5cd6s
         ZrqZH6BN40cRyxtJlcHWhzkH4r5AgP4oCf36Ak+nQ0OkscmsdXL7ATQH6e6nVNhDknGX
         uzN+VDbS6qfKcH84pZn8NLb0MJoje2fGsknpU6kng8lzIKPh8sD2t5TRpbEuu1pAwETM
         /Nww==
X-Forwarded-Encrypted: i=1; AJvYcCUTjjVpBs7Do2oY/rErUK6yeiwat62iVYocnlbIV0nV8jnMFmYVzeVqAAYPfYecC8lJmcRm+mQfA9f51Zc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwZjiTeix9eGc6tHxyIwpfmyphdXN7ZuZTw65IF+JJTsbNbVMH
	xp2uaTcbDrXx0r0l0twqTyXWEERcljqccUYDmYsVv2xJdx1M3/Lb
X-Gm-Gg: ASbGncvEVYphKROcOK/h0GXSlmIC53NQMqDVWRjOoWyuPopBpRYGfLu154x0itziNRF
	iok1CKebYfl3XGt/N7sK2V3P7ETgXNmgHEWlwgqsHhokE6dhlNC1axk3s3wGPYQPf7Rlljr74Zn
	Syi8rzZ05NtBA3el6SGBJIoFLNXHRjMM0lJvP2OBVT993I95D1pLNeasHEDtULEx+hhPYJ1ZhHt
	aQHdWFD8DC0AXCBoMDXf0rHxbUBkIAL8RCFaSmDRuBba+D39Zj9bUPdLMY/4PvEp1IR3CMEJByw
	ixMZk8ZVesJ1fZVDxZVaBXIm6gxgGZklkZpf87isTZDlHn6ioUjuPCOlt6i5LKgR/5TOEWiBKYz
	f8gJAzfozxYg+
X-Google-Smtp-Source: AGHT+IGgr5m8Dk0n55iv1MKqVZzx7TaJS18sRJPfqiAWtlbeZi2/V7bDveGQntwRqXyOlwlFB/yLog==
X-Received: by 2002:a2e:bc04:0:b0:30b:cc6a:ffd9 with SMTP id 38308e7fff4ca-30d7e0c0a5bmr57914071fa.0.1742887673905;
        Tue, 25 Mar 2025 00:27:53 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d89661aa3sm14307621fa.31.2025.03.25.00.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 00:27:52 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 25 Mar 2025 08:27:15 +0100
Subject: [PATCH v2 4/4] watchdog: da9052_wdt: respect TWDMIN
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-da9052-fixes-v2-4-bfac3f07b4a4@gmail.com>
References: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
In-Reply-To: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=945;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=cKLX0CYGXCgbuT+agxT2tRVi4WrqxSVTWlH3Cy35LjM=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn4lrl9g3pMK7L9AF6+oHJEdEExzLMF+t2lM1CU
 uLwvAzMYP6JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+Ja5QAKCRCIgE5vWV1S
 MnBZEACKaQtv8n0h6VX88DQJggE2vCwJGzV5urJti3dMwh5IaAIlU+FibQq6PthuGez4y/xNCHN
 tXI2fLYtocamSFb0ldO9KQQUvge9v0XzGkRvvt6dGQRcmigQRcxa8z2seuUP5t6HonNrSK6i2mv
 QqyxoZbs5cTO7vuEvFjYEUcY4hwfFU/KXRS8vWGLuc5trTSM2UATmk2d4jqj0701zPmB4CNUX92
 y6hHGgJQ0k0ISekoSBurAV4Kbe+KWT/5iFNGc3bOBKcdWjY+/uUMQkfXCGf4yuKat3XUIikIoa9
 Tak2fUW3MF9EMcO2TGbKp2IIdAk4Rks2eLP27PtlwG0muEdLjkXNsNV2+RAMR2k8m3m7ID9v0LP
 69DdSj36Tq8kUYwlqGkoyEhcs6d6tRnN3Tnis/7qIjFYnZzz0qFAtuYGsn5YtKp7XMwikXzNV+W
 Domlh4EOz+oKLsP7eXRiRInqZmw8zfTAgu0ZIeS4ifzkF36cD0C4LXcl0ACI1Ip3rj707YfF4pe
 DDC+C4jZfywVLIo7688cU/evn2ijkV+gmyN38LcHSOrDtUrhYFgApz83Fy/LBebAuNyKQtfN0AA
 xIDsfBCLwanC+g2HB638qBQmxHfKrKVuGNOPEWdICdzkrp9HsXXZv8uYhBVKjWBMmv+Rb8ogKE/
 mBorJHeYT3unlNw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

We have to wait at least the minimium time for the watchdog window
(TWDMIN) before writings to the wdt register after the
watchdog is activated.
Otherwise the chip will assert TWD_ERROR and power down to reset mode.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index b821006fca70480bf3b23a62bded4e66851a537e..1e49cbae7eaec3015264dec891032a56f56e36cc 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -179,6 +179,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt = &driver_data->wdt;
 
 	da9052_wdt->timeout = DA9052_DEF_TIMEOUT;
+	da9052_wdt->min_hw_heartbeat_ms = DA9052_TWDMIN;
 	da9052_wdt->info = &da9052_wdt_info;
 	da9052_wdt->ops = &da9052_wdt_ops;
 	da9052_wdt->parent = dev;

-- 
2.48.1


