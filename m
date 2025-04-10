Return-Path: <linux-watchdog+bounces-3280-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AED48A842A3
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Apr 2025 14:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFB13179DD8
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Apr 2025 12:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E00283685;
	Thu, 10 Apr 2025 12:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAkbzjD3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E9198A2F;
	Thu, 10 Apr 2025 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744287055; cv=none; b=L6IPO41R44GjuVG76UYQqATZwvBymVHPsAe+JNEDglVH/UsjYBYqoakqu6S/iRFR3pZuBEEiJ+MAMVVgne9jadAJ7nIt8n5iSMQ0hY81erTAMEHHcRTD3rAvv+NIp4i9BYJXlnOYHeLH7zvRiMV1nc9ivvh8leLmYmDav1dhO8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744287055; c=relaxed/simple;
	bh=W89uqurvfV2ffvRAadFN8DfjUAHNIlyYLWQuHh7dvds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhI5NCiAIfDNJH37zkbELyY6aMrC7zxNZDeizqcINfQOEZ7JMvYWF6/LU6XT5y7Q3wUfM+G1/ndmTlgDj7QGC+9Gc2xgMwpbasE064hapfObvIwbiSOGUVHS8IKjPq6LvhbhMvZ/r0RePNFrcVG4r+wQc5QZW3k/RBbi2xZCZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAkbzjD3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2255003f4c6so7100425ad.0;
        Thu, 10 Apr 2025 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744287052; x=1744891852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SG1DwgSYKF7Iuy6VY+Yfuv0GEqkxa2LoLkZRsBjQyyI=;
        b=gAkbzjD3+xKgvbPciC+FiPlgU3eGsw1oJzilhzuuKNbRH27NFKbPSGN7DbjS5qJGFk
         hfyZtAy1WTaQYV1K/48xNnQmeeGC29CT7qces9b/kZ+rc6grfnmPySRItdbH4FXcEdLH
         oZralK7L2SqBgR6zcwW4dqRmlqRLsRuAFMV6pX5wySL6C7v6EK22D9kJ/jhyL+XjTsob
         VgNSAZ4Nl253buSKDrwXC2paXaO3WG2iMdGg+O14LXPyQAiWha0WiaAJXJIWVQCZqzpz
         frJTvqWQpIYUuCmr6GgtT0fAHusUsrWD1Z4dG2vzmyLREwKS7PAkkbuP1cMaoknXJZkq
         LjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287052; x=1744891852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SG1DwgSYKF7Iuy6VY+Yfuv0GEqkxa2LoLkZRsBjQyyI=;
        b=rCCf+ROMVEAVVLkg4FtOhH1WlI67J2VuhcSPJCGyIetPeJ1PQhAoKTUtQP5OLmGes2
         nb7/ju1pet0TKNDsxAgqmYUM8CVUF4bmljxmrKaHeJV2UHAObM5CmP9ZXceR+UtRKFFs
         jKi+iZddRyU2FhcujK1uX80P+p63tOgzCu8jY2erEZD0Ot8SFk6C8V/Lln0x6tfOv2tK
         6G+PBqp1bISGOIKif4wKhN5zJzdVbOTqFhpExz7DZ2CR93vBpjFtZRIoxpW4v8WTT7mH
         XW0tP/CUcPKWucRpP16z8aGVHOKlNIoIqYVGIkU+j9FJRNiZt8uPAjYdQvPwF+QG855S
         oLbw==
X-Forwarded-Encrypted: i=1; AJvYcCU36B5H6kPqyHBdbqunHLod/H7J6srNwLcDdVhJTcP1KgPqoJmXvSVrMIW2LlKnsNHi1bXQFCpG9swA+J17DCg=@vger.kernel.org, AJvYcCUzSLrq9psw6p67g+QFFSDpe9GTGytXJWHzv0yhLOZohJ46TnVq/Btb2Qve5ytvJsEsx9kFnjs64JXPLVU=@vger.kernel.org, AJvYcCVm4HocQE8yh8AagW9LWny4CyK6Evrjvp33cMxvbDLHZFLIETjmbE46MdcGRzcd/Krn2Zjiguj7uHPYIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcsp+S9UrARweRrWBNAS59601b1vpFYhEgXgMd93e5WDCVJqK
	H00mUAxltJKbFy6KN84qiSA/9SW1Yl7v+7JFuXeYQx4FVy8ApW6O
X-Gm-Gg: ASbGncvMlA3CF+rsrNza99/aAGkbFn+5lzVbeksouH78ijnQqBk453eWBuvxWX6v/iq
	fAN6/M9rIFtFpATGW9gRbiZRyOmikKViZOMnsbF6uIkMK4ZyPeuGJ+NCaaON//x/EIpSpRt4O/I
	wPpCgFh/aYvY0ASzuJygfkegNkDBBAY1G5H0XTSUajGdzopOlAEJtoecy9Ba7rQP0P/OIo5KEDX
	mXUGd4Lh5Ph7O6HsdUvqIyukjkQM6+2jdC/4mTzJpx61hhWXGNjzKuSGmLSa/T8R22knXl9OIVc
	nj1sxBuF0n59MRkZVyv3w6Cs5C64GHVcG3iwuRU6ApBPsgd68abQxSkoWQNsSRDvw5Z7Dv6p314
	we//1RVR8tPwXDNzO3bu01RqU
X-Google-Smtp-Source: AGHT+IHdd2cc/ri+v71rQo8PKP2VgMHOLXyWv4L9s9sDA8hBblMITR/YOkATIOI9o71ngVe84cnBOA==
X-Received: by 2002:a17:903:1a68:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22b42c28921mr43610385ad.38.1744287052402;
        Thu, 10 Apr 2025 05:10:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2b20esm3074470b3a.2.2025.04.10.05.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:10:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <abe3b3f3-0c9d-4ac2-af1f-59aa186c723c@roeck-us.net>
Date: Thu, 10 Apr 2025 05:10:50 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: diag288_wdt: Implement module autoload
To: Heiko Carstens <hca@linux.ibm.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
References: <20250410095036.1525057-1-hca@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250410095036.1525057-1-hca@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/25 02:50, Heiko Carstens wrote:
> The s390 specific diag288_wdt watchdog driver makes use of the virtual
> watchdog timer, which is available in most machine configurations.
> If executing the diagnose instruction with subcode 0x288 results in an
> exception the watchdog timer is not available, otherwise it is available.
> 
> In order to allow module autoload of the diag288_wdt module, move the
> detection of the virtual watchdog timer to early boot code, and provide
> its availability as a cpu feature.
> 
> This allows to make use of module_cpu_feature_match() to automatically load
> the module iff the virtual watchdog timer is available.
> 
> Suggested-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> Tested-by: Mete Durlu <meted@linux.ibm.com>
> Signed-off-by: Heiko Carstens <hca@linux.ibm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   arch/s390/boot/startup.c           | 17 ++++++++++
>   arch/s390/include/asm/cpufeature.h |  1 +
>   arch/s390/include/asm/diag288.h    | 41 +++++++++++++++++++++++
>   arch/s390/include/asm/machine.h    |  1 +
>   arch/s390/kernel/cpufeature.c      |  5 +++
>   drivers/watchdog/diag288_wdt.c     | 53 ++----------------------------
>   6 files changed, 68 insertions(+), 50 deletions(-)
>   create mode 100644 arch/s390/include/asm/diag288.h
> 
> diff --git a/arch/s390/boot/startup.c b/arch/s390/boot/startup.c
> index 06316fb8e0fa..da8337e63a3e 100644
> --- a/arch/s390/boot/startup.c
> +++ b/arch/s390/boot/startup.c
> @@ -6,6 +6,7 @@
>   #include <asm/boot_data.h>
>   #include <asm/extmem.h>
>   #include <asm/sections.h>
> +#include <asm/diag288.h>
>   #include <asm/maccess.h>
>   #include <asm/machine.h>
>   #include <asm/sysinfo.h>
> @@ -71,6 +72,20 @@ static void detect_machine_type(void)
>   		set_machine_feature(MFEATURE_VM);
>   }
>   
> +static void detect_diag288(void)
> +{
> +	/* "BEGIN" in EBCDIC character set */
> +	static const char cmd[] = "\xc2\xc5\xc7\xc9\xd5";
> +	unsigned long action, len;
> +
> +	action = machine_is_vm() ? (unsigned long)cmd : LPARWDT_RESTART;
> +	len = machine_is_vm() ? sizeof(cmd) : 0;
> +	if (__diag288(WDT_FUNC_INIT, MIN_INTERVAL, action, len))
> +		return;
> +	__diag288(WDT_FUNC_CANCEL, 0, 0, 0);
> +	set_machine_feature(MFEATURE_DIAG288);
> +}
> +
>   static void detect_diag9c(void)
>   {
>   	unsigned int cpu;
> @@ -519,6 +534,8 @@ void startup_kernel(void)
>   	detect_facilities();
>   	detect_diag9c();
>   	detect_machine_type();
> +	/* detect_diag288() needs machine type */
> +	detect_diag288();
>   	cmma_init();
>   	sanitize_prot_virt_host();
>   	max_physmem_end = detect_max_physmem_end();
> diff --git a/arch/s390/include/asm/cpufeature.h b/arch/s390/include/asm/cpufeature.h
> index e08169bd63a5..6c6a99660e78 100644
> --- a/arch/s390/include/asm/cpufeature.h
> +++ b/arch/s390/include/asm/cpufeature.h
> @@ -15,6 +15,7 @@ enum {
>   	S390_CPU_FEATURE_MSA,
>   	S390_CPU_FEATURE_VXRS,
>   	S390_CPU_FEATURE_UV,
> +	S390_CPU_FEATURE_D288,
>   	MAX_CPU_FEATURES
>   };
>   
> diff --git a/arch/s390/include/asm/diag288.h b/arch/s390/include/asm/diag288.h
> new file mode 100644
> index 000000000000..5e1b43cea9d6
> --- /dev/null
> +++ b/arch/s390/include/asm/diag288.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_S390_DIAG288_H
> +#define _ASM_S390_DIAG288_H
> +
> +#include <asm/asm-extable.h>
> +#include <asm/types.h>
> +
> +#define MIN_INTERVAL 15	    /* Minimal time supported by diag288 */
> +#define MAX_INTERVAL 3600   /* One hour should be enough - pure estimation */
> +
> +#define WDT_DEFAULT_TIMEOUT 30
> +
> +/* Function codes - init, change, cancel */
> +#define WDT_FUNC_INIT 0
> +#define WDT_FUNC_CHANGE 1
> +#define WDT_FUNC_CANCEL 2
> +#define WDT_FUNC_CONCEAL 0x80000000
> +
> +/* Action codes for LPAR watchdog */
> +#define LPARWDT_RESTART 0
> +
> +static inline int __diag288(unsigned int func, unsigned int timeout,
> +			    unsigned long action, unsigned int len)
> +{
> +	union register_pair r1 = { .even = func, .odd = timeout, };
> +	union register_pair r3 = { .even = action, .odd = len, };
> +	int rc = -EINVAL;
> +
> +	asm volatile(
> +		"	diag	%[r1],%[r3],0x288\n"
> +		"0:	lhi	%[rc],0\n"
> +		"1:"
> +		EX_TABLE(0b, 1b)
> +		: [rc] "+d" (rc)
> +		: [r1] "d" (r1.pair), [r3] "d" (r3.pair)
> +		: "cc", "memory");
> +	return rc;
> +}
> +
> +#endif /* _ASM_S390_DIAG288_H */
> diff --git a/arch/s390/include/asm/machine.h b/arch/s390/include/asm/machine.h
> index 54478caa5237..8abe5afdbfc4 100644
> --- a/arch/s390/include/asm/machine.h
> +++ b/arch/s390/include/asm/machine.h
> @@ -18,6 +18,7 @@
>   #define MFEATURE_VM		7
>   #define MFEATURE_KVM		8
>   #define MFEATURE_LPAR		9
> +#define MFEATURE_DIAG288	10
>   
>   #ifndef __ASSEMBLY__
>   
> diff --git a/arch/s390/kernel/cpufeature.c b/arch/s390/kernel/cpufeature.c
> index 1b2ae42a0c15..76210f001028 100644
> --- a/arch/s390/kernel/cpufeature.c
> +++ b/arch/s390/kernel/cpufeature.c
> @@ -5,11 +5,13 @@
>   
>   #include <linux/cpufeature.h>
>   #include <linux/bug.h>
> +#include <asm/machine.h>
>   #include <asm/elf.h>
>   
>   enum {
>   	TYPE_HWCAP,
>   	TYPE_FACILITY,
> +	TYPE_MACHINE,
>   };
>   
>   struct s390_cpu_feature {
> @@ -21,6 +23,7 @@ static struct s390_cpu_feature s390_cpu_features[MAX_CPU_FEATURES] = {
>   	[S390_CPU_FEATURE_MSA]	= {.type = TYPE_HWCAP, .num = HWCAP_NR_MSA},
>   	[S390_CPU_FEATURE_VXRS]	= {.type = TYPE_HWCAP, .num = HWCAP_NR_VXRS},
>   	[S390_CPU_FEATURE_UV]	= {.type = TYPE_FACILITY, .num = 158},
> +	[S390_CPU_FEATURE_D288]	= {.type = TYPE_MACHINE, .num = MFEATURE_DIAG288},
>   };
>   
>   /*
> @@ -38,6 +41,8 @@ int cpu_have_feature(unsigned int num)
>   		return !!(elf_hwcap & BIT(feature->num));
>   	case TYPE_FACILITY:
>   		return test_facility(feature->num);
> +	case TYPE_MACHINE:
> +		return test_machine_feature(feature->num);
>   	default:
>   		WARN_ON_ONCE(1);
>   		return 0;
> diff --git a/drivers/watchdog/diag288_wdt.c b/drivers/watchdog/diag288_wdt.c
> index 76dffc89c641..887d5a6c155b 100644
> --- a/drivers/watchdog/diag288_wdt.c
> +++ b/drivers/watchdog/diag288_wdt.c
> @@ -29,26 +29,13 @@
>   #include <linux/watchdog.h>
>   #include <asm/machine.h>
>   #include <asm/ebcdic.h>
> +#include <asm/diag288.h>
>   #include <asm/diag.h>
>   #include <linux/io.h>
>   
>   #define MAX_CMDLEN 240
>   #define DEFAULT_CMD "SYSTEM RESTART"
>   
> -#define MIN_INTERVAL 15     /* Minimal time supported by diag88 */
> -#define MAX_INTERVAL 3600   /* One hour should be enough - pure estimation */
> -
> -#define WDT_DEFAULT_TIMEOUT 30
> -
> -/* Function codes - init, change, cancel */
> -#define WDT_FUNC_INIT 0
> -#define WDT_FUNC_CHANGE 1
> -#define WDT_FUNC_CANCEL 2
> -#define WDT_FUNC_CONCEAL 0x80000000
> -
> -/* Action codes for LPAR watchdog */
> -#define LPARWDT_RESTART 0
> -
>   static char wdt_cmd[MAX_CMDLEN] = DEFAULT_CMD;
>   static bool conceal_on;
>   static bool nowayout_info = WATCHDOG_NOWAYOUT;
> @@ -75,22 +62,8 @@ static char *cmd_buf;
>   static int diag288(unsigned int func, unsigned int timeout,
>   		   unsigned long action, unsigned int len)
>   {
> -	union register_pair r1 = { .even = func, .odd = timeout, };
> -	union register_pair r3 = { .even = action, .odd = len, };
> -	int err;
> -
>   	diag_stat_inc(DIAG_STAT_X288);
> -
> -	err = -EINVAL;
> -	asm volatile(
> -		"	diag	%[r1],%[r3],0x288\n"
> -		"0:	la	%[err],0\n"
> -		"1:\n"
> -		EX_TABLE(0b, 1b)
> -		: [err] "+d" (err)
> -		: [r1] "d" (r1.pair), [r3] "d" (r3.pair)
> -		: "cc", "memory");
> -	return err;
> +	return __diag288(func, timeout, action, len);
>   }
>   
>   static int diag288_str(unsigned int func, unsigned int timeout, char *cmd)
> @@ -189,8 +162,6 @@ static struct watchdog_device wdt_dev = {
>   
>   static int __init diag288_init(void)
>   {
> -	int ret;
> -
>   	watchdog_set_nowayout(&wdt_dev, nowayout_info);
>   
>   	if (machine_is_vm()) {
> @@ -199,24 +170,6 @@ static int __init diag288_init(void)
>   			pr_err("The watchdog cannot be initialized\n");
>   			return -ENOMEM;
>   		}
> -
> -		ret = diag288_str(WDT_FUNC_INIT, MIN_INTERVAL, "BEGIN");
> -		if (ret != 0) {
> -			pr_err("The watchdog cannot be initialized\n");
> -			kfree(cmd_buf);
> -			return -EINVAL;
> -		}
> -	} else {
> -		if (diag288(WDT_FUNC_INIT, WDT_DEFAULT_TIMEOUT,
> -			    LPARWDT_RESTART, 0)) {
> -			pr_err("The watchdog cannot be initialized\n");
> -			return -EINVAL;
> -		}
> -	}
> -
> -	if (diag288(WDT_FUNC_CANCEL, 0, 0, 0)) {
> -		pr_err("The watchdog cannot be deactivated\n");
> -		return -EINVAL;
>   	}
>   
>   	return watchdog_register_device(&wdt_dev);
> @@ -228,5 +181,5 @@ static void __exit diag288_exit(void)
>   	kfree(cmd_buf);
>   }
>   
> -module_init(diag288_init);
> +module_cpu_feature_match(S390_CPU_FEATURE_D288, diag288_init);
>   module_exit(diag288_exit);


