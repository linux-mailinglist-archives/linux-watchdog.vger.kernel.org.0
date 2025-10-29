Return-Path: <linux-watchdog+bounces-4453-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEE1C18CC1
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 08:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33ACB1B22D9A
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 07:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14512206AC;
	Wed, 29 Oct 2025 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZte7FYb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B5E23AB88
	for <linux-watchdog@vger.kernel.org>; Wed, 29 Oct 2025 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761724349; cv=none; b=TEBKwKDKCQ0ITnjXvFsTsyAv1XJ50X5XE3vKuC9VgLKAJ3nr7NovJhu5N16SauVRARhj2dFAXdU/wOveAgJyq/5tOOKxIN6VwMU2OKufEchI8FFI/uLrOnw31Y2Uo25SwbCFDQwa634vsow3R2tVf7DWcF7JcxWXNYmmuh5Tk3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761724349; c=relaxed/simple;
	bh=IMW6BUzhnHMYMMh4rjjj8cnueWo9qTKE34YZ47hy9cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bAlT72K8Q4N4tK1pIDBKvdFkg/SsIxsg7WJdXC6SIVhws7KQXpkMtmDCqlQRhkrgI80pdWZFR4kkOq3Vtk9PF8hG4OrcjS1GtJnw/gKhCgjq2krR/kxTeTwl/ZBNwLvD4Tht4OMMYpRNfjEb36Hms8YGsfDev75Hp2i2fmNR07I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZte7FYb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-273a0aeed57so8463225ad.1
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Oct 2025 00:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761724347; x=1762329147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OYK/28I+NJFr6r7cOZ0pyoRm8+eA5vm+A19ZLzCLbOU=;
        b=YZte7FYbCPoFfayAmfAxHoxtk1FpZQlYMXLkjLfBNQNELx8WBWRUaG1X7V38VW0sHl
         TlCYMFsCxNZ9M3EfD2GkURZmnJuJlR57Ror9A/H5sKW+ARPoQOdG+qLdr1o9RdcuW5oN
         /onXnxxYBzA6gWl2T4HxYgku3DvKz+ckJ9eakbJ056oHeJljnpjT3BcB4dJfgt4l3cSJ
         gbZaotpjLrSHG1QP0c1EuvylgIFRS4SC2MWte4zLvIFr0scWmrw9XhPBQFRle6tR2pFi
         F8sGrcod5pwB5PGJj3JEaujXWRZ3y/Gk8iMYPEhSuvvGA8FsDYTtm6XsgreKAP3BqVqK
         zALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761724347; x=1762329147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYK/28I+NJFr6r7cOZ0pyoRm8+eA5vm+A19ZLzCLbOU=;
        b=UTsDEq+sm3bX+X+OJaH6Ok5nH7TbUUOIJXE8c8D/4uY/cosOg2nN5/UFig2J8OXuUh
         O5m7PZZOw3RmkVtJDCGcWDSQnr1efwtZ/8QhHHRSFxMcMugGZwdrHE1RuZtrlMkZBdXr
         6V4ot3sYRQF32FlrWv/dt5qEoU5kYTrmgHB4kw556ARLugiIIPC0EewUtf+bzvtntIcI
         aoBpiHLLElWa5omq5LL9MYzgw9bOVpMJrfPBOz07m0AjJB1fdu5uatLpO/LXuVBUWjKk
         v1FqCUON3RNAaGU27TkNLZWSjY38mIFdS6PCEJOn/qmPf5qTKhFbpFpYqDNc2kHsfMqn
         fxow==
X-Forwarded-Encrypted: i=1; AJvYcCX3nQ7R9UqvS+ESIGPFr7RfNqjIl9HMRQ8WwGtqHsvY5GYabnCB7UFBvMgGTgSCSbbCzpJE0bjnzQXdsiDyFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFkN0QgV/EaBCUcXnyCOlnQ0/C6kvUzMftuVCpA03JhG2f/okR
	wcHWSHZH9N/cDY4CUE9GpLtK7EPm9f2tmPgiM+Xw/ApEEJ0exaVMgt2+
X-Gm-Gg: ASbGncvRPPdtMcQWjpR0LE6hZ3GJfweJ/3/WOZu8Q/Tv4OBV62Rk9jxdMUN7rPeESTL
	xVu5XwSc3uSUd8edMg8+tRVDNbc3jlzGaOu4QoWzmEkY2E/DO4jP9ZBVSbREmGNyvm8Fqpn4Gwl
	I5wlY0Ss+uxe4RnBXvT/OumGXoDEbbFq8uG2Vxj7UmnOboGdBHyZt7dYV2/OzoasWWYZqNm6gXX
	koV/dGmFdlBRG8HFGJRNb8VEJnBVNd3dLx1hGgIP/Ito1tcIUFqoeeoCmv1pQnao18E1SefugM6
	exwqXwyntX7WucYSrdJ8QxLqRIMslHGRG5AMsUuhrrv2paAR/Tgd3IXGjz6KgVvvaR3C9B+Udl7
	xidLy1FFspmf8i/4PbXBBXLcuSLJbTVRLXQxCsqIfaVpIRXgJ4FQuro1GZ2hM9UqZeUnNUY8qRT
	MfQy8h0aXFf7QtEeUi/pkSc3WXzEbGqjav5j5L92BVQd8PGdFSk9Nc9HyPuVE=
X-Google-Smtp-Source: AGHT+IEb5Ookn0tin6kAZTcUD2AapsuRm707UiU7RfKGYivM+xG1NILduFa/3DqxJ9NW8z15wyLDwQ==
X-Received: by 2002:a17:902:da84:b0:249:71f5:4e5a with SMTP id d9443c01a7336-294deb3445bmr24345535ad.26.1761724347170;
        Wed, 29 Oct 2025 00:52:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d42de5sm143526395ad.76.2025.10.29.00.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 00:52:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <85e146d6-9f8b-4d3e-848b-31aee79d66be@roeck-us.net>
Date: Wed, 29 Oct 2025 00:52:24 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] watchdog: loongson1: Rename the prefix from ls1x to
 loongson
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 loongarch@lists.linux.dev, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20251029020847.1946295-1-zhoubinbin@loongson.cn>
 <20251029020847.1946295-2-zhoubinbin@loongson.cn>
 <dd97339d-a984-4e74-8043-be99046c5102@roeck-us.net>
 <CAMpQs4L2cGjTFUWAkFaXuvYpHS-SYC=8X5HD=yR6aQMkdvr9xg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAMpQs4L2cGjTFUWAkFaXuvYpHS-SYC=8X5HD=yR6aQMkdvr9xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/25 00:33, Binbin Zhou wrote:
> Hi Guenter:
> 
> Thanks for your reply.
> 
> On Wed, Oct 29, 2025 at 11:39 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 10/28/25 19:08, Binbin Zhou wrote:
>>> In order to introduce the watchdog driver of the Loongson-2K0300 SoC,
>>> which is similar to Loongson-1.
>>>
>>> As preparation, rename all prefixes from ls1x-specific to
>>> Loongson-generic.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>
>> This is unnecessary. We don't rename drivers or function names because
>> other chips are added to a driver. Doing so causes unnecessary churn
>> and other problems, such as (in this case) loongson1_defconfig no longer
>> enabling this watchdog. Any userspace depending (for whatever reason)
>> on the driver name would also have problems.
>>
>> It is ok to make the driver more generic and remove the "1" from
>> the Kconfig description and from MODULE_DESCRIPTION. However,
>> please leave function and driver names alone.
> 
> My initial thought was that the loongson1_* prefix might cause
> confusion for others, since we aim to support watchdog driver across
> the entire Loongson series.
> 

Off to Wim then. I won't approve the driver/function name changes.

Guenter


