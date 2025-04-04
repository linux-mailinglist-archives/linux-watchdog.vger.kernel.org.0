Return-Path: <linux-watchdog+bounces-3208-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C8BA7C036
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 17:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E66BA3B4F9C
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 15:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C802C1F2C56;
	Fri,  4 Apr 2025 15:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5pUnjXw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E474E1DFD96;
	Fri,  4 Apr 2025 15:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779151; cv=none; b=InF94Icvtt8nsBbR4FsilWLky5VlHbh4cjgAlg1lq5oujX5a3w00h4z19NhI376xic57IW3qJghibD5WvRSr65MONHPfnvY3XKjV9GWILefyIyvpj7J0LtTg7XDBcoQ+248kUxHJuNdziOPQD2/j6b7Jrr+X47c9MbUIYLlZZDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779151; c=relaxed/simple;
	bh=odDwUF4iCiVZKBSowHqLJZIoRcOcLJxPsX0DA5VGj3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=V36skNrdz90p2xLGivSSQCHM3qqsP0/OYtkOfQ7Ywmpe1gWjNfE23Vaa9t1yVJ9F/YWJ/o5t22z/Np6zBOp2naVUoxfZXHbnp4RjoM/bAxbuJO+GSvtu0cMf7+WiZNF4p0wi/28g2wRjBJVgWtwjvYPEfUG5RVg6hNnh508FKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5pUnjXw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227cf12df27so16675315ad.0;
        Fri, 04 Apr 2025 08:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743779149; x=1744383949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CjBsQ4Ri6reMmGQPRMBXanL+TjDTt6xr+zSXucQBz7c=;
        b=E5pUnjXwhj47tn8ITgOQlGHscSRxV0bsM5RtpsFnxg7D1h0qbG0T9qX5nRn0CX9l8H
         GGA8N+nLfPBmqaLx7/pF590aINlBAglglEVx5Qz35ZaV8tqyrVPBO74NeIiAdEQ+/dzE
         eNhujNbhMQenF8cZb9DM2OhEjZZAwMjDu8Q+sadJNRvLRDYvZ305mFWrIxB26vlQZ83w
         GSY30uKOXrwrHibWloMcwfQ2tsB1XtDOibG/g6S3Ox6VCzG/YiZPiZacRHHJniumW7+7
         j1hgFRy/GTSFYyWgjelNNt6c1lLm1vtjVJyharYk7g6hCO7FIsWlJyoA2CBOKmfNfqIm
         jK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743779149; x=1744383949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjBsQ4Ri6reMmGQPRMBXanL+TjDTt6xr+zSXucQBz7c=;
        b=tj05n0E+5niVbXxsgJFT+N09wn/8j7H5cZj0TSduunFosR8uDjt/KQps7s2TJ+cO0P
         gQk7Nd5wyQb+V7f0LSUn2+P9Qtu9hyvZjj4b33BIwXGOID3UpPXes5I04Ufze//Jy/h7
         Y1ge+CzhVAc02hu+R0K4W9T9U3oKDzug+2kNzyl0IAaYMyUhuGOlYYCr5V4XYeefif29
         4iORC7TcFrbxtptem47vDun7g15nrHCi7iq9DcNbCxUY2v+cSPSDSGwJy7v4XOzfvt8U
         n75wyYMu/Al8ca+wWxIuxMdYLFMa2pmE0USTjBuJ1QqfdQC8oBZa8LpXQ3gTaW9X+Bky
         LEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQaecntiGCHC92rubRM5pHNRQPlZuefClYwbmmlp0IHNa7Ke9/UeHPAURpxcv3nwk0ov3PM5SSyT8dt9c=@vger.kernel.org, AJvYcCXT4/jjsVfg7v2GPSUiNf/nk9sGGlk634LHzl4uvx3r0utSw5H0HlK84gnUQGnP3RG/eDc6PL+P4bT8D8uDqmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8/B1GCNeCYgw8tgeZLx9L/yEqcEHtiT2KEy/v/MJ3dcpXfq8b
	ioctGvYjxlFdNEaIULc6PjZW6GDyc+ZmvEK1hsf9jocg6WIGZeBZ
X-Gm-Gg: ASbGnctpfQ06vHa1ZaPlCocfVTPSCdJHoMZb9irDOEW2QLyTSZX43ITMPon7b9GfMBq
	ko1DGc5jcxIwZGGZHPSIPv6rn6UqEZKribFOU8+GZoS1F7vQFDUbFpJo1rGiuQdujcp3nZAomfN
	7IokIBIYHAXtnPt7XeMGwVTf0PjCFMwZrPPXkPe+504zIYARptfi95qKcdBHET5Q1ox1jr91TO2
	a3E0V7z2GSX+GfPALgCPPzRYb0hHSXURNpOUzxhzVB97tbH7XeHeeH65dtjIf4WgQ7Ok6fnsf+T
	sR9EpN8QvhqgXX+mFa3uDJb7H6gI48yDa9YFIksRxuHjwJcA1pygOypX5aB61KZPvYiwPsf0AIA
	yXFLTqq+bY5avfoYV8SRrJnm4Vcb8
X-Google-Smtp-Source: AGHT+IEKlCIUvX925AHYxeAEIEvkEN/tYchON2r08L7CMw1fcm7BWS4peQ1QTw1uwjVyFLzPNQpspQ==
X-Received: by 2002:a17:902:da86:b0:224:7a4:b31 with SMTP id d9443c01a7336-22a89a3e820mr46563155ad.6.1743779149073;
        Fri, 04 Apr 2025 08:05:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad88bsm33172255ad.48.2025.04.04.08.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 08:05:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <07979763-df14-4511-8260-1ffe387961ad@roeck-us.net>
Date: Fri, 4 Apr 2025 08:05:47 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250404123941.362620-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250404123941.362620-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/25 05:39, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


