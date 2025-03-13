Return-Path: <linux-watchdog+bounces-3099-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6DA5F3FD
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 13:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D25F7A4313
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 12:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FC72673A2;
	Thu, 13 Mar 2025 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdQBnqHg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4461A266F16;
	Thu, 13 Mar 2025 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868125; cv=none; b=RBfmAl69AIr3rBeCicrn7LQsGzs+LoZm3xV1zpj/hYpMesDu0BgqJnvXlaI1z1srl+jEN3bWrZpvwgbBgKW4GVwg2ykZRzB/l6Z0hmeHRRJgPaoLcw425oexj7tfu2Cq1tfbqCufM/ERJNlaPyHAAMRb1UfDXFL0MfLQjqmEmTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868125; c=relaxed/simple;
	bh=xWrATJzy0fqpfJxT3BHyi0zOwfwjKp0GUehuOTG34H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fxg8w04z//V0lNQbKmkOLHby3n9ZmpDKf6Lx5yamTRXKBpR/AOosk5CmQNZ5wSWYN07uWb2GBGM7cTmMjbTCzZfXpT/bHOEzBE3Hs2XW9gumWYYKfVYC1qXbaV01tKW1AvW631Yhz74R+q45Vy67IqOo3azzcClSY1Rvb+bTgJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdQBnqHg; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-307bc125e2eso10478701fa.3;
        Thu, 13 Mar 2025 05:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741868122; x=1742472922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NchkLmxPVzjzeuKKYV3hJaJDWOj3zJcFyf8KvswcV4A=;
        b=fdQBnqHgZkdXe9GIUvp3tBd/h1mro+iSn7L31IZEM2vAKUcTVckaoHAIvZzXKs7CP+
         mo6x2jaOV2nXjeKZkrxUpLEfbTbVzfPmgkAwtZgKNgqdGAJR2PHqO3VhraN2re80iica
         Ra76jSzxoRP3p734afkDvb5zVEGiyUn7ITJeuo5NymY832yJg2HYl0uJk1K7IrzYc5BS
         SYRTQCFHraqaXsR6Gmc/ELlrtvGsm/xy5AuOh41rzrGe5k5l1tTTdhRI5UEUC3Eq2QwF
         T+kEKw3w6/Zu8s0c4M3LY3TZP3s3y83WyyWojE0Md/sl7GcAj3zcYbGOPAS32bO4X/73
         OKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868122; x=1742472922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NchkLmxPVzjzeuKKYV3hJaJDWOj3zJcFyf8KvswcV4A=;
        b=VDdGgT2qOlV2wVO3Sj62EE/uwcrBrWKmBtFUOaguCY72jYXbxl5Byfv3hr1IkKgKQM
         IntW9jI7cRfPPZD9Gi4KVeFeUOdHTSf5T5NtSQ9KUNtZr9WQHtCmZKbGSfEU0dXE6NTS
         +Gf8rVY2DSucQpo7wVLVLGuzUZ8/q7QrH8CHNv2gOFQGuZi6DNDdAhoaTq9mW4GZYQV8
         3uAorl61M5iDowvSLtmiG3gjRP4DJeaMfj5KohjzmfD7oC2aUHH3uVuBto0o6NM+Y76u
         NEzvh2uvZzPzgn19jR7Rb+pHSh0heRur/QlCiT0RvXqG43v1BMEAC5NnVubiTvrSH9RG
         p+cw==
X-Forwarded-Encrypted: i=1; AJvYcCUhm/vG9+OscNNuVjZSbSTpvQW2jBRv20SgGRutjrTRKj4nsaNpwvpUSQlbi6q9dmYT66Jzx7cXW+PfCgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoolGkFOyrtr9a8ktycwBlRtD2cr+cfzQTpJ4ELFAH3O3p8lJz
	QHtuK+i03R7z2Y9M1i8/R/LONt9nUL24GlOA9xXMCruZLPTmr+3C
X-Gm-Gg: ASbGncuNtrU7QcA4RKZk70TdFKrNGoeKYf8VA//IMpCx4YgeSDR8PRQrnpcfY8SUs4R
	BIbiYx28XlWd8aoQzL6NAR4GFJMkGPzAL5+MB6vjmsn88ploBUvGbORPtGpMrHrlKqu0+ZZ9swg
	028iCUAcvWcb4aBSfGfReVogAvSrVYzhEeXzPbELaMn5Ndp8GXzH7JQw/k2WNIyAde0MBGyV+T8
	uESariQ9bh6rmBzDy/N8JvpWRisKzTNIc2k4tnc4pPU/0ORwAgW2MXanVsIuWPMI54USw6CYnsY
	oU9Vftfd+1jy5FQVbTTCMCL/97+t1zY676H2sY0IWJqQGtLrJGWDLuCCz4BE1nO4qZTv/3ydds9
	h0GWPCMI0loLF
X-Google-Smtp-Source: AGHT+IHfKZ6TqjIrCf/nw2gMMwzdGnq8tc+dDltv67gFS7UhcIfAPuXhuzVmc3pUF+J4hrvtHINocQ==
X-Received: by 2002:a05:6512:3c98:b0:549:5b54:2c5b with SMTP id 2adb3069b0e04-54990e67418mr10412156e87.24.1741868122213;
        Thu, 13 Mar 2025 05:15:22 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c192bsm192851e87.89.2025.03.13.05.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:15:21 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 13 Mar 2025 13:14:43 +0100
Subject: [PATCH 3/4] watchdog: da9052_wdt: do not disable wdt during probe
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-da9052-fixes-v1-3-379dc87af953@gmail.com>
References: <20250313-da9052-fixes-v1-0-379dc87af953@gmail.com>
In-Reply-To: <20250313-da9052-fixes-v1-0-379dc87af953@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=xWrATJzy0fqpfJxT3BHyi0zOwfwjKp0GUehuOTG34H4=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn0sxIs0j37DpVkzxgRUudQjOJgdKFRWb5lGauC
 Xzz/2/SXFiJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ9LMSAAKCRCIgE5vWV1S
 Mty4D/9kHsxzbNIRY/bioO71WBI7ImqUyPs7wpNZsgawHRLT6xFLSdVsFu7DjmB6bpKs5bv25yo
 m9m4F7KdcKsW7gPzz4OdgQRk1rS7Se/Dy0EfYjNriz7OPnBeQbGEtDZpn+NpUvWhKuTazFFhY0b
 8CqIdJTR0cDJxOsH7X0hpwALwlD5hLpBMGQShE1kvDkpMw9PRTbYsG1xsvqzQm6ivM2Oj4BujjI
 aGL4NjlU0CYOASTrn2gtTpKFdb0k4nRS80dYpVQVYoMRA/Y62HVvwq/Qg7i9wQNz6mUmZtZ9SwM
 FZZf/JvBrPV6Kl8p+ihngcoJHRDMr4m4T0ck9usTRdI9VaTXjcLgcTrKAWe76LbyKpPfe4odwoQ
 SDPk4sUBXfv17TMHYMb2Dl4wD6v8j3HgaywQjyC1EIJosD6HAzgsOXx2ryX8raDen3Pk/la8pry
 y36iSWIjr0I1DF1sTXBPPzlr/cy0HQjvFRRudAIM8SxqC2ENj1/92URdpIOgNfcJJk6PpTW+tgs
 9brW0GHafnS9N1Uu5+5O/ldDFlXq6E/gooo3W46wxgdKBpNnwNE4+ZpFZb5370XZPCet9Am/LLn
 Fi5tx3lcuiTuh1+3z6IQsvWJsoK89FTF9TOURSsyY65XJDGEtHmHKmqlErmoXwF9Rw2e4DrZ0YF
 SV/VPrYENb3H+nw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

If the watchog is started by the bootloader, we do not want the watchdog
to be disabled.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index fa9078d4c136a52f1193768fe93dc04189519679..90b620b11b5fb634372e18ce4c40568cd946f284 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -194,13 +194,6 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	if (da9052->fault_log & DA9052_FAULTLOG_VDDFAULT)
 		da9052_wdt->bootstatus |= WDIOF_POWERUNDER;
 
-	ret = da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
-				DA9052_CONTROLD_TWDSCALE, 0);
-	if (ret < 0) {
-		dev_err(dev, "Failed to disable watchdog bits, %d\n", ret);
-		return ret;
-	}
-
 	return devm_watchdog_register_device(dev, &driver_data->wdt);
 }
 

-- 
2.48.1


