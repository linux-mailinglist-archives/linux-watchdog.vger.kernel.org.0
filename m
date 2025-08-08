Return-Path: <linux-watchdog+bounces-3987-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6E0B1EE4B
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Aug 2025 20:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3F7A5A39F4
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Aug 2025 18:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2451721770A;
	Fri,  8 Aug 2025 18:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJavTb8F"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79810216E23;
	Fri,  8 Aug 2025 18:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754677173; cv=none; b=PJJeYtyupwOvAtfPfQNIVRlbpvsonpKe7NmrlkuaTgY6gZI3MOn0vzkP1yp80hwvgwV2WktPm5qO+ZR1BoRMK2cqOMW6jFJF/3cib6ZL3NYIprweT/OzX8m3q9WMuM5gCktEniTbZM1323nD5Z58BfEzGCrjiA40UwHlJ5q2zXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754677173; c=relaxed/simple;
	bh=HUdaSvYdQz/Cf1Zjkz8l7fWfolE+877uMvSYaXEl538=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=caP4BtZOdtL58ao95JzZn7h+Ox2gtE69hte6bJbX9OUSEAiniZo9gesi2RAGw3tlzHOm3r2uiPWlHnLKTDZa75SfXlpMEOamM7GGm6BDYmQoMPFt7VtgU/UnO0LrLQjHt99hycHf2v0VmiMv1TSWALQAzA8dK+zkKYaoVA4y1+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJavTb8F; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23ffa7b3b30so22979615ad.1;
        Fri, 08 Aug 2025 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754677170; x=1755281970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4V/L9rLNg1kMY33SaIHQ54KgyoNy4p5D1r2ZzBM+uRw=;
        b=PJavTb8F4h4Xaw9ridG4xDbVRBQeMGM0OufJ0H9cxrR4jXw5df1XJ+VzPo0/Q1n2IX
         OYXPF1Df3inGXXMMl8KjpeMKxXmbkNpX0v2nDT7TvC5ajPTkWRg0EOIQOB1XZecHr5o9
         Dg77KbmzI7hGsMVwnNa7RbTMzHW7iVmkpl18WypLZnT3QZa6FK7bddPAQuVgNFU3vSka
         crvfkxLhuki3Sv/f4m6KUXwkBnnhTPlP3CiSQp9gLSTSB4rN7hgE0AkcHmpLuR+8dCUQ
         izkxEmttCSyVi57dh1fD9UXHb15BEHb5LXjUN0G9Y2LedEiN/J63l9h8zzQ/lY32Q5x1
         66jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754677170; x=1755281970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V/L9rLNg1kMY33SaIHQ54KgyoNy4p5D1r2ZzBM+uRw=;
        b=PIeE3SdPtgfmhpOwe0B0UlQCBbyusTItmifRsgZf00RlDkvWr3vaPYrFWES6bI7TRw
         c7nowLT/pGGnqX5AgMjeAg0n5/h/8ESGRhnGqis+QJMNOdnlqFaHdQjcuxpE56qDeNMc
         GR3PN/0sEUEm4k5+zdh48CJHjftEqxoAmZHRGy62eAWiX93P8WPnRVVt7cRjd1NExegC
         aQtnZl37VjLeoDe1BCG/hJkcJmMuxWPrM77inaWuZIK/HzxZjyjz02zasSb6cmQ0QEqd
         h7sAYza9UtjHTqrHxaoBDXc0vfbPgywPGg0prehNMHcd4h1wdNv7Eo/r3ns9JwXJom0G
         FX+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/06x6TMi77CTYQYJLlnaSaXFpOZQpFj6pLSUfxAHJ2BikT4llr9q/BTHXVZUEM0L3AbS31w9WdJUz@vger.kernel.org, AJvYcCWlXdsp/6nuGjwXvFNONdPsgHd2iFlfODIfYwTn1Tv8r2a3vUYyJMPAK4gJyVmH8ZCn0OfOs6RYAgTknV6h@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm9at43C6/+XHrdQ4jOlOOuQZu1o516fEfFg7rcOCMRG1Vn3vw
	uOR402dgBH2GjrjbvP2iOXvnaCppNzIZX5fHbllv+kDn/WrN1TXllyAKHTamzg==
X-Gm-Gg: ASbGncuMla3a3NKZHyf5v+OF+8GQR6XkRo/JUNpgVVTDjeIyuAmSrY8SAOHPHUy7R5M
	ip7nrivy877pfhp7hHUnDrvYWdwNuMY6j3otRRkfVddEPrkXERWbOC4ewJt1QlXon26iqA+xA3H
	3JD14jWzteSWhMs7AIlnlgoXXANxwgmIiHnYGBS44Qp8YcTQnS6tzSnc9cAD27N1LzCi9D+L5pZ
	gSFxgGinsgVxtjim5GNxdV3JsMVaA+yDmaBiqY1C4ctrmvhZ/wCpVByfBFKd4lGzKEyEgJO4EU3
	4qVxgyAXIX6x2S/DyvTgF/A+zx/1Vb3qdgynMWGeiGE4yuvF5meTGSgB0Rjnha9+QyjAwm3k9bp
	bN1m1AV7PXO242vQfXP67wVL3Hw0abSp5Da8XNpbTOEsU0ivX4erPDm4yx2iuj3YcNuWAZeQ=
X-Google-Smtp-Source: AGHT+IFVe/i6moWtqoWq6jBtlW6sPnaGKOUwILFXQ+AG9WdqP609Q29WzVXEpaXGo1/FJH3OjydAdQ==
X-Received: by 2002:a17:902:ecd2:b0:240:7753:3bff with SMTP id d9443c01a7336-242c220ad2bmr52843235ad.30.1754677170151;
        Fri, 08 Aug 2025 11:19:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aaafefsm216465265ad.160.2025.08.08.11.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 11:19:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1e7527ad-acce-4163-8e7c-9d66f17ad926@roeck-us.net>
Date: Fri, 8 Aug 2025 11:19:28 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: Drop duplicate
 moxa,moxart-watchdog.txt
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250807214222.4170236-1-robh@kernel.org>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250807214222.4170236-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/25 14:42, Rob Herring (Arm) wrote:
> "moxa,moxart-watchdog" is already documented in faraday,ftwdt010.yaml,
> so drop the old text binding.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


