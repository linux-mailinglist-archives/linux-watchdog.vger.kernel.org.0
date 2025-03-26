Return-Path: <linux-watchdog+bounces-3146-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124C9A7129C
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 09:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 060303B4DB6
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 08:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BA71A5B90;
	Wed, 26 Mar 2025 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dk2p6MKb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6647D1A4E98;
	Wed, 26 Mar 2025 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742977837; cv=none; b=Fy8kCOrLlq6UMMJ58iSYFppTX1OPw6ezRQ54kJB/wrMxAnNdGPmvUOTVmNvsH9r2B16OF0kScGcfzfkC0uQR/w5tAeTlit0jgYPMREd8UId5OX6kcEFaY6WuIRRJGykuhpT5FAB3rFNqdcao9AKFaPu3UOnJv/lY9WCmtc/0agw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742977837; c=relaxed/simple;
	bh=Y7Tb7REcp4IVUowiXTgxdrggbJRLsx4zoXWxPxBsNRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tKq+uBp999E5BJ9lIDisoQ854Evf+NTmNTmDq+AErAe+q7P2pnZBJGgb6unkw8jpHrFLjBhitUJwcki7n/xRqODzpmenchGdbsFnNiRu2b2DbjndCBP0P4vUizUrPAUCDR59jC0q7/5mb6wVypN+9f6RFkWJYs4YE4gHVlXr7g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dk2p6MKb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54acc04516fso5832601e87.0;
        Wed, 26 Mar 2025 01:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742977833; x=1743582633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaYWAIBldb3Ft0V5uoOvvbTS164jcqGGf0vp8fcR5lI=;
        b=Dk2p6MKbX55INLUlEY89HKvhtiUMGZ7oqKfstvvSeM1DIu+4gryGf3efnMuTKwmzKb
         IEry85A6JR0Wag3HuJ15bT5ULvXanh8jVg6AKZEPdLCq405sIN7lf/4RrF5XN1VJ0eNm
         bBF+ELFSlHYirO9YWoD+11o7S91kMn1o3GS4mUlVi1CZ9H+FwXmgRgxzoy2DYttPn9Bh
         AOTD8jakQgch98bWNHC1aX7Yaq8ceMnl5LYahLPy73R7eUo96Ldo8KPbaCV1X6UZ/uxt
         HziWvFMw48sl+jCagPGJIJQcy3TU0tMNpPjhtysHzcp/GIlrxQ0zbq1qwmgjjaFke25v
         yefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742977833; x=1743582633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaYWAIBldb3Ft0V5uoOvvbTS164jcqGGf0vp8fcR5lI=;
        b=JJ783LMvqkKTv+ND6+YtLh8fcqPYxbts2xN3RbRI8ltRzZVEsVegqw141bnlqP+J/4
         0+PZRbsfDMH7QE8LGMey4ruSbquPmL85UYy94Ai/UBv5ny6Cwe5FiwUrwb7zFwgroP8W
         hb+H8OZ2n9B3Uznfp7YW699ZHxesSIiU2gFExkIg3ODH5dWfqVyxUdpqO0jQOnv9sXkP
         1hgHfj+x3ql6QJR+gJ61s9g+2YqxjVGJVP+ir7M9vEETquw1r5YKf9DDDexaB1Z3OCp0
         y0of5Etcz+Wh0e6jQY0J331kXJY91qf9narxpCpHx1aUoqKQL5Fkx9Rvs4swLsb7q1u/
         f06A==
X-Forwarded-Encrypted: i=1; AJvYcCVuwgxllzPyYgwi6yodqJ2vFVnq3j2A5Vp8GWqUJjeV92DDpLRE9tqN2J1NJP/fBwA4bNaEksd41CGP2Zo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8k9cLH1ONeq7ig/NJvVpUMhIGKnAJLaGkuN4LMCeBGwqINKMo
	ezIVyTJyN3C097XXPgCPQWT2tqfKoVOd2Use5dgHF0yeU8WPR+IQAZbc/jIw
X-Gm-Gg: ASbGncuPzRU13vpAG9hJdxhHdQbRcgKLm9YpvmC1JwiYghQK3aPApA2Axb49dNEoXa7
	VXXmw6sJ6E7NP9fLetpFsUPI+7GXkorGwSqaSeGBnL7Tkcyfug+4nK4QZz/6KnyTn9NAF3Pi3Xx
	vrW01XixkhHaj/Y4pJqGHEjC9Mxff9W4UcztkuAQZXcaeqJEDruFYVAQdcoWh1vNg++2U6R+Pyx
	jkyDEERSRGNys6BbH7dRKroIoCiFcTC5upp1dMP/637fi7vrX/XCPm4s9UvC1shGPbsI4YDeuUn
	th6nOZUkRWR8jh4W7SBUB2hZvCB8zs/Y5phkoPbQWaRwwS/XCebgKftShbLDFWazanZCvJGoIYK
	io+DmlCNP0I7u
X-Google-Smtp-Source: AGHT+IHrHjTWaKc53Jv+8qhpfoxveppVvdQbDrbVKD9IDVZ1tPZ7WkTUWCI9sWmuI0bCc3K8Rn+4CA==
X-Received: by 2002:a05:6512:2243:b0:545:2eca:856 with SMTP id 2adb3069b0e04-54ad64768b9mr6538248e87.9.1742977832834;
        Wed, 26 Mar 2025 01:30:32 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c6f2sm1707406e87.79.2025.03.26.01.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 01:30:30 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 26 Mar 2025 09:29:49 +0100
Subject: [PATCH v3 2/4] watchdog: da9052_wdt: use timeout value from
 external inputs
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-da9052-fixes-v3-2-a38a560fef0e@gmail.com>
References: <20250326-da9052-fixes-v3-0-a38a560fef0e@gmail.com>
In-Reply-To: <20250326-da9052-fixes-v3-0-a38a560fef0e@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=Y7Tb7REcp4IVUowiXTgxdrggbJRLsx4zoXWxPxBsNRY=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn47sPKT8bx7EeD6LmymKliHbXR8SDK3XTvBd7O
 kLtuDZZokmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+O7DwAKCRCIgE5vWV1S
 Mi6nEACyZpUwy2TK7IDITXOv4WpwyiVVUmOdx+bnpYJ0iyL/qOX0pTTM2IGZnC/S+AWuTLQP7e9
 rvK+wwZPLU+swvZf8SfiA9xf91Dh81kXIGMuh3bdMCcAe73rMcM8eIERsGR6jqySwh0IpD/JyYS
 ODUTqsyMX1eu223hnI38WHvSlIYiBkavh4YUmz2XVHOJ3J/FBpTbqRTuwNThjROrN6oG+XAxTzH
 Rcq75bsx5U/K3l5+eYJNcX11liXtGVr2+pI7fR2qjShW+ZWUN8lLkuhoowdeUOjF2vXSYBQT6DC
 JzU7LsD2vMDC5gtNwIApXPMuiKzAycQSzoFhXdt5p05eRG/pzf8Nzy40LFOKKgRRkI/ktRxr97q
 LGTctyJqaKCgbUjkowfRWGVaZMZyY8mNPfHoNbmZK7H6NbJdA70xLKunk7zNohhyg8kVkka7423
 1Q2W9O7g4GYfdZLRWpSO85Uabfmbamsjn2P6NKTMLbQ3Z+PPPIfVabyQCiO5xyysyVV4lQA/glI
 bVWySn//fzipIorRwIqChxMR772diaAyrFMkgSe/+5WVhOUP71LbJlMoW7Cwh3N6RzQDLKI70cb
 SHm2eA7UP1eXd2vUiqEUXYNypTGLnCu9jGp5Hfjutl6eDQISm3zYgS4nSf0lmaF9LvGqV8PnvKk
 ybJ40IS8tVRe+tg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Introduce the `timeout` module parameter and pass it to
watchdog_init_timeout(). If the parameter is not set or contains an
invalid value, fallback on the `timeout-secs` devicetree property value.

If none of the above is valid, go for the old default value.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index a8ff1e6a7903f6f139c5bb60d7d92ca39077ee04..fa9078d4c136a52f1193768fe93dc04189519679 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -36,6 +36,12 @@ MODULE_PARM_DESC(nowayout,
 		 "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+static int timeout;
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout,
+	"Watchdog timeout in seconds. (default = "
+	__MODULE_STRING(WDT_DEFAULT_TIMEOUT) ")");
+
 static const struct {
 	u8 reg_val;
 	int time;  /* Seconds */
@@ -178,6 +184,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt->ops = &da9052_wdt_ops;
 	da9052_wdt->parent = dev;
 	watchdog_set_drvdata(da9052_wdt, driver_data);
+	watchdog_init_timeout(da9052_wdt, timeout, dev);
 	watchdog_set_nowayout(da9052_wdt, nowayout);
 
 	if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)

-- 
2.48.1


