Return-Path: <linux-watchdog+bounces-2209-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B9A99CBD2
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 15:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D2FAB232BE
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 13:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1AB18638;
	Mon, 14 Oct 2024 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2wlHvQb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8065B2744E;
	Mon, 14 Oct 2024 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728913620; cv=none; b=DhYvP7z5T/VzHWx9vPZpkQ3NyCjNZPASluuoXL/nLIbM1TivvVzxykUF/69KKJgq97B49gPoyYUcF8y1wIoW3Rj+SP1bWEkIPFAKMoZkkVLOu6c5PdtGDfjRB9c5c16sMo63dAKZ832GJivFHHzkrnIzhB2MpOl3UP6s7m/qpeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728913620; c=relaxed/simple;
	bh=1Qfz5WRlc7atjo7A32D1BmN4wVuxcbwyOF0lgtqqCkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lyWlIiQlS3QY8aQ4TGF7ygnnzRgMw27PS6QTb0L0Iy/CniZdu5ldShLOaOLUgzT55y9RVg2KyflB8XaMlEUR5mhbZQWgrQ97V8sg1kDG+xIa5eIfHjghc5YOtGZ8KktYpJE+xMtANXr6vT9PoyX6kY9pmGj//8nSjDfULec07G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2wlHvQb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cbca51687so17682005ad.1;
        Mon, 14 Oct 2024 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728913618; x=1729518418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WyaIT4UWTEOLUmIjIjtUXvmzX1RGK12UXFI3fbmT1Z4=;
        b=a2wlHvQbli1MOYEnzmXFAbUqMxah3gxKTI77ea8QPB1ZNcQM9QzFJXU2KnHdNTswAG
         2EOPhOT5E8P4Ru4oyGjGz/JgXZKQwta7WHqUR9hoGLUe6MQzMzHrS0oXXMVqeqLm1JBU
         T8kzTwjAPMsqeKXPABG8VbfRwKqHei+05TM+Yp7NZxhV5v3f+fTnhm+wjFa4ZtAXv6on
         YiGalmFvVKDC9Sz9vpIgjswxHOe1IY3Nhx2E74YMdELzzvSAQopvYaBMmZdxL9c2Bc5j
         0kiQhuFpl+GlpU6HnumDUC+XolkdkdaS48tApb1AGWtn8jSSbGAwumGDONZFitLEWxmM
         pInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728913618; x=1729518418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WyaIT4UWTEOLUmIjIjtUXvmzX1RGK12UXFI3fbmT1Z4=;
        b=LBDRzbgWq52MAwS6E08sPf6lc2uTdc+qtQQtG/j14TEC62YMkp7PaS0zjQr50GbCVA
         6TEztd3XOlEDy6rBPkfeVpyOj8pgUEVz0uF3mUH0n253+uH+pcWrRNx6pbbHrqzLCTHJ
         gUq8fXksTeDKSlb2VwLbaLtdTB0TqLjxoBHckrQzDiiFNQE4X/ILVN9aL8ISFr8XnEgh
         nP8zTAhklXk1B4+orMGH+bJrSiB948C53h34EnFmR9n3dgw8ja65Ky2doFhPIBvADeno
         9d55q5HjjSOKSm/GlgZXLxLYma1pt7+6EoxZD1WnOM6R2BXEH31wSgDed73iT/A2+WOs
         03fA==
X-Forwarded-Encrypted: i=1; AJvYcCUSOSxEoBqmlpDqjB/sI+u00Com8DtUVVdCEjOoecvdE66sg8U0fTEr7kPzv0QYFNAp/a62czEJ9WRf2aQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvojDMrScR2QG5Bi+YY6tUc6Hdi0ghVojSM5Mlj/3fyNPfBX00
	NgJ7oMymH0T8jVhKS57j+o0EPi5KUQcUiYlG6OgidAjPALbvExJz
X-Google-Smtp-Source: AGHT+IFXFAdKPGQs+5cdm16rJ0/lvbDMdkYetFl2/8TyuiNtQbu85qQRc9ihnh5veGcyVCMbxbne9Q==
X-Received: by 2002:a17:902:ce07:b0:20b:4875:2c51 with SMTP id d9443c01a7336-20cbb216d1bmr111931205ad.27.1728913617676;
        Mon, 14 Oct 2024 06:46:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc0d34bsm66186755ad.97.2024.10.14.06.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 06:46:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <34c582cd-8321-4ee6-bab5-a285f332e103@roeck-us.net>
Date: Mon, 14 Oct 2024 06:46:54 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Add HAS_IOPORT dependency for SBC8360 and
 SBC7240
To: Niklas Schnelle <schnelle@linux.ibm.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Arnd Bergmann <arnd@kernel.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241014-watchdog_sbc_ioport-v1-1-896ccf311839@linux.ibm.com>
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
In-Reply-To: <20241014-watchdog_sbc_ioport-v1-1-896ccf311839@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/24 04:25, Niklas Schnelle wrote:
> Both drivers use I/O port accesses without declaring a dependency on
> CONFIG_HAS_IOPORT. For sbc8360_wdt this causes a compile error on UML
> once inb()/outb() helpers become conditional.
> 
> For sbc7240_wdt this causes no such errors with UML because this driver
> depends on both x86_32 and !UML. Nevertheless add HAS_IOPORT as
> a dependency for both drivers to be explicit and drop the !UML
> dependency for sbc7240_wdt as it is now redundant since UML implies no
> HAS_IOPORT.
> 
> Fixes: 52df67b6b313 ("watchdog: add HAS_IOPORT dependencies")
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


