Return-Path: <linux-watchdog+bounces-4725-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DFBCD24FE
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Dec 2025 02:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE3FD301D666
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Dec 2025 01:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B0723EA98;
	Sat, 20 Dec 2025 01:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Twed/oYE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75EC849C
	for <linux-watchdog@vger.kernel.org>; Sat, 20 Dec 2025 01:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766193961; cv=none; b=UtV7DPUnjSQsRQPxgYuc+RsU642jFiseHizdjNos4HcwMWuXRSLnXnDXwULO+FGsjgHM2VT7xvbgFw5QsQ8DvWq2J9iysqObWjoo+EA8kLNOFxXxakCX2c9el84azHbjQMkxs7r+1Q9kNvhZDp7C/PSLsR3tR/3HHaG+5oJJB+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766193961; c=relaxed/simple;
	bh=4qQUJji36HOsIw9vOa6lImujkBzrm2SmYuYcw10Anao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fu4pS6uV3OxonyRCTw3u5lotMFB1oSG/mlhm7RMg9x3BEGGaKKrjiYJ2B9R0qz7grilsjTcieWp5brne8Ri3vFSkwv2YZKpJbXEOM5PN2t0tmIZ+V7wKBW5gknJi6msCFvT+D/K72lRSJu1KqyFi0CwRJ8GxEx5oidLJgkYCFWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Twed/oYE; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c13771b2cf9so2039844a12.1
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 17:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766193959; x=1766798759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0DJIhP0YFpBBfEPHBiyQmsQBdjrtYHi5Q9PjLXWgZ0=;
        b=Twed/oYEonY/XQUWRhSW9+zBijIgrNIQ7IOV+kjf+aoNx/FDZ7JmgDhxAsI0hEd3Tl
         quvtxgGvBYvxOt7qK/R5hdcgeZzrIT3X9ichg+nyGyKmCi0dNpXdjeuZEc/7Pt3n9uzr
         fXzDGlpMN7rl1h/mL7w5uD3x49VD7dG2VS8na2QTg3MzsDz0vevp+RDlVu3MzmF+tH38
         2R8Lgea3Hq218E3YOsItj/MQbJLyEMIVC6D+7ooutTJ3OObRUFGnvCy3nSEHhZ635P1q
         9vGD9A6ZXUS3V/3WNoe+T7Bs/AbIKmkQAbjIiWknqVh26YH/DPv6gH7SK0/LHnsHydJo
         Ut5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766193959; x=1766798759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0DJIhP0YFpBBfEPHBiyQmsQBdjrtYHi5Q9PjLXWgZ0=;
        b=E0szejdpkekL9pirFmQ93wdJG9uw8XZyxco0YAaIuYEx7281+bQbAfjQwC/4gkj3kb
         ZX/V7iw2o2s1Uyzp6hbxxrlDxWSiH5SpeetUOXsZ/1IXACeV6tQOCmTlMI7b1jtsGk5W
         tH2WnPijP1gnzTwlycgZO4byicD5E8BskCx1wMOzaH+dHAXSu47jRP519Wi+rAnlbAOW
         GFTqPVdoQtVy2p0nIDgJ15ttr1DNXUMcIGxCI4vSkS+QnqtKDnxVdY6sqF1xvp0OBniP
         zlM1hMtVmUGCFhfVMUkFGUoNAajq5bBoI2Vy3O+gy907i0nhXVoQfWVlnTuyfwNAiAaF
         Dk+w==
X-Gm-Message-State: AOJu0YziRroAdHTX8EhxX0rHcCjYu1GfMpX58llQvW/JYVRHPSXfN95Q
	A/kk91ASo9B5qbe88P5XMvoCNpsbNqaA9LAjXXDyMiv189uiwh6oumDL
X-Gm-Gg: AY/fxX4lSwY2+oVlYn+UAXGLs151MJWCVA7SxTWDgBmGMg21hrzt/XnTdU11xmqtoTa
	Gwlw9FnwtNnl2d8YRPY9VitcwB3jexC34ioaU5qN44zVgbESeEaX3kZWmpQtmBQqnsuqUXLjYDL
	6ykp7lzBMcp6WsdIq5pp/QJSX1NWy7M7025m1O2sZUQ6jgX2B8MKatzX9i/tDRnZgAF0XmwW5OB
	w802OSF0Y3B1FZ5A6zPzn63V2c0j77cL3CHmCT80erQLSzOKx8E2HNar4f54FfwfcN9z5IRSqQp
	hetK9GSp/Fy+Rx7abjkXj/owMA6hGTWjMK7ex5z4ECpjlKmGJ7Wmdnq/ifmOt4YRIIkCI/OjvVb
	BCqn8dvGfSYPQDLl2mG7x7yW0dE+nwosKuAUmyCQCredVuIgpYl70ZzpYvJe44RLw49JV8ZpTPt
	/cvho6ctAg5ZoeM/3jA0oBc3A8mtWhtUKJLAfzcJD+mmzdkTqjZIRS4EMiTGke
X-Google-Smtp-Source: AGHT+IHC6FWD7VQ7zLxFQ+77PZ5YWdkQvi98x+F4n+f0iXKBTGkWbOemtZYNOkqwXhR9nQ9qEsYmaA==
X-Received: by 2002:a05:7022:1a83:b0:11f:1500:4e9a with SMTP id a92af1059eb24-121722e03e0mr6511838c88.32.1766193958838;
        Fri, 19 Dec 2025 17:25:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm15382755c88.12.2025.12.19.17.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 17:25:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <327ec335-204c-4408-8522-f8c4f6be346a@roeck-us.net>
Date: Fri, 19 Dec 2025 17:25:56 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Make API functions const correct
To: Kari Argillander <kari.argillander@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219-watchdog-improvements-v1-1-9711c519474a@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251219-watchdog-improvements-v1-1-9711c519474a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 12:42, Kari Argillander wrote:
> Many watchdog API functions do not modify the watchdog_device nor
> device. Mark their arguments as const to reflect this and improve
> const-correctness of the API.
> 
> No functional change intended.
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


