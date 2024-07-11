Return-Path: <linux-watchdog+bounces-1356-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B892F147
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 23:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63F0A2837C9
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 21:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D27442042;
	Thu, 11 Jul 2024 21:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNXj68XP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6061ADF43
	for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 21:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720734154; cv=none; b=PAxagA+rbLmVbiboa8WAIMzb2ZwB5kEVpwWoJA4yVC0bfoSIGDPhKF8fYI9I6/jtWoCo28+ruTGbUf3Y4ULo0jJDfEPZ6TzareP5hynj9W61yDz1cT4wH5Jg6gzjFmqu2udGjauHi8l/6ULFu1f0F1StRFRS4VFYxCfh7xzyWds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720734154; c=relaxed/simple;
	bh=f6ahqJ34MgGLZsnQftVbwGRfsOrtjzneO2BWqSCiAIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XktEwH1MqhMU7l1iitCny/pI/i8Jw3Jr68/0vlYyqFV3oV4czvS/ycLiKy+7STf3icm2nqS1uJrufyRvtnR2LKlP4Ldmu6U6xwl3MHgAOet+R1XVNTAnM8J6DiGTrOvjIgkvOtaqaiBCogN1TdngFhmm6U5oNfE1neXJ70fjsm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNXj68XP; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70b0e9ee7bcso1120051b3a.1
        for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 14:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720734153; x=1721338953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2X9fH1ZV8743hgiN9vObcWZQa+7gdtnxM0O5oFB/A9I=;
        b=aNXj68XPPmh8fjUQ6TKNU7Fk8B1++ZtuyX3TELk4pH3ya2gEEBmKPqZsAFt2F4fFvy
         uZe/EAnOX4uJucIKYkpyMCbKvKl8ykwhtYlWcc+7Bc+hxiuRNS+sYyssRHzevg0maa2I
         0XEGpmJfupwb1zWbz0Cr+WPBdZBplmiTw4YcbtBTqmlF4UtmIRAO1ENEhbd0+qihcUzx
         i43fmBDmIC1EoJYXw5s74s95lVLwpuhXKGzQu156P2IyiRMqtTrXKvrpmoYQxAbVPJHp
         QuvKpgA1WPDkOy+rGYCZsBiog5pglUB7/WaZzTywRWF3q+pz3lY4TwdGiAoaYf+hzi8b
         OqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720734153; x=1721338953;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2X9fH1ZV8743hgiN9vObcWZQa+7gdtnxM0O5oFB/A9I=;
        b=cCjgt+MeoUaR19messvA19CAEkQYekCbocIpfi17chz+2Z4DqwK4/6+06YecTzPfbp
         n1E2J5pFJpssLQg6Qcj8aOE2QDW3SditRzX2JMGAuzjSX/3AzAKPtIIC4ctUBF8NnR/K
         vKL24TzyWuPwPDFSWs2aqXSaBXec+MFpqju3eDmFP6N+IE0QTyKE6/TXODKGDaitqI4c
         ADIHjEoFcONs3Q1Uim8XU/6kp/jARx//6g/DNUpWdHCerf3cXEWR953QGv57LcuT1y4s
         lMsxNBzB+fuggGlelZXkMQKosIan3dNs+A3fa7T63qi7GXYULlGLc6gfUl6VfBEBf8Rb
         t4tg==
X-Forwarded-Encrypted: i=1; AJvYcCUsWfXdkjKdcKk4ZTaq1r+LPBn99W1rBxZP6AN1jh5nAUfDusFe5DPjLl6mwi/hP0CC6D6dvnJ+D+3zC9PUs/QBLK2d49mIBIv+9bbdSeE=
X-Gm-Message-State: AOJu0YwOuWGhfRigLOI6B7OMc+jLroB67Z/tFApgjYbZHqK0NoZvwjaM
	c8VkA3YbTgTtWaO3yKgiwfN+0MVJZXIHBr5eHUihSDTWiKLSqQUc
X-Google-Smtp-Source: AGHT+IHv8YwaaOMOMf6cKbHUtOBiqaa677R3s4muaXxVeTShOV2JpZO/vcyXzpwmgnN8w3TSKC3frw==
X-Received: by 2002:a05:6a21:789f:b0:1bd:feed:c031 with SMTP id adf61e73a8af0-1c298242b20mr13169787637.28.1720734152536;
        Thu, 11 Jul 2024 14:42:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43899502sm6162218b3a.2.2024.07.11.14.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 14:42:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b09058ca-9547-4d70-96a7-b7fe6b8beb3e@roeck-us.net>
Date: Thu, 11 Jul 2024 14:42:30 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for
 IT8784/IT8786
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Werner Fischer <devlists@wefi.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
References: <20231213094525.11849-1-devlists@wefi.net>
 <20231213094525.11849-4-devlists@wefi.net>
 <CADvTj4r58ETz-Yym+MMEcu0DDeW-xbXBRGHxfZAfyGqOj3prGQ@mail.gmail.com>
 <9770a65c-e08a-4f7c-9ffd-8899d8390e2e@roeck-us.net>
 <CADvTj4qk0QMafMOD81D=95oL3Qyc7Jd0C5_gGjtw+Kbn=_v9WA@mail.gmail.com>
 <49f46f96-dfc3-4c50-a33d-a6cf1b67066d@roeck-us.net>
 <CADvTj4ohSu7ngB=M8eEpA45shos8M9YM7bbDHhOy=HQVk9YG3w@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADvTj4ohSu7ngB=M8eEpA45shos8M9YM7bbDHhOy=HQVk9YG3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/11/24 14:09, James Hilliard wrote:

>> The best we could possibly do might be to add a check for the bit in register
>> 0xf1 and warn the user that they might have to use the ACPI driver if the bit
>> is set. I am not sure if that would be helpful or just add noise, though.
> 
> Do your systems which work with the it87_wdt driver have that 0xF1 bit not set?
> 

I only have one such system left, and the bit is not set on that system.
I avoid buying hardware with ITE Super-IO chips nowadays since their support
for Linux is non-existent.

> I'm thinking we should check for that bit and prevent loading the
> it87_wdt driver if

No. That would create the risk of no longer loading the driver on systems where
it currently works.

> it's set(maybe along with an override param). That way the wdat_wdt driver I

I prefer the less invasive version of logging a message. The user can then
block the it87_wdt driver if it doesn't work.

Guenter


