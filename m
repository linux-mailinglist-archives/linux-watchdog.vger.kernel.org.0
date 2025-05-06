Return-Path: <linux-watchdog+bounces-3438-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E6DAAC445
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 14:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8841BB21A61
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 12:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF52027FD72;
	Tue,  6 May 2025 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie1PWsCz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B88E25CC58;
	Tue,  6 May 2025 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534715; cv=none; b=aqi/Zpufa1WUZM5YUMJGu3kEnXeEVW6vu2hTNkzuHy0St7vZZWswVgu+GoTO+0DP+ri0Wgd5yQEzEik36/JKRIMfO2q1t/zvUVLZPV2fNqz8JrQT9u8K7EZpi9P9F5SegcvaSBNm9B7wMLV91B06Kvk/fN6uL1jQz3W77FHhjJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534715; c=relaxed/simple;
	bh=fbM50uctibnlw/qbePGAcHei61hqCspesv5iOU3zdbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCE4mOmjEF/XsbMnupo4LQm7zP6Ci1kqe469Newt5CW6/1JJNsVz3XMiiAhN2kHWTSvJOgAI4EobwmLhG69HLm+Q+izWoEPjV58/hhd5xH7epdPqsIUSB9V0SBGzqLoSj/JbVm2jLsAa/r2127wTwHKZslJ6DMYQnyoIwEBlT/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie1PWsCz; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30863b48553so6075322a91.0;
        Tue, 06 May 2025 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746534713; x=1747139513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8idUtLLebZkZiwySpCodlAhE9dZe3P+VXk1B2OGGqzg=;
        b=Ie1PWsCzXpbGMZzqD+LAZcB9Ims+dkO+1JYcztkuigF2TpEVuJCf1ltTMw55y+wF+r
         vKsz+tH5jpgs0mcUU3r6SQ2/DDLSRTB+SNFNt7WCztDlXXgaWHpB7O+AO0XQ+FNlOrXM
         bGlkA6qOVxz8XlIEi/ap9MUS2mJ7VBKK/DTR3C2t618X7Rxg7Z0YOOx6HBiIeygmEypS
         9RpUbvxqDSjdbNHOzadyZfQfGxnwvN8f+KsXgfWzrYpsTYL5BZqaaC4JulVyQb8Z1Xr+
         6S16KRQ41i1oXO8DIKe3xZ5vXdGED7A1seW0wW8pPUuLyPItbC2FVfhRSA0iMbq8VKh1
         11CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534713; x=1747139513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8idUtLLebZkZiwySpCodlAhE9dZe3P+VXk1B2OGGqzg=;
        b=cP6bLVpf9xnQVdNbHYSxD58OphHfn1fKeA0/pCVmKI9ki3tjqmVtRYzMHKLgRbk4bm
         +F/KEzW8gikdYNkcYpfExFjcSaaKyZOuR4VcCO7JuiAfF/fsldNUDr7hFYnw00NhuBCN
         svxhVRYYbFw7bCqskyJ8v/Z0aGyZgUguVQlbRlzxwb+Mxd1AGFlvrN6/9CYku+GxNjSh
         rv5FnCNtD/1k3fuK8Ku3+bM9hrpiIFNq3bDGiHwbJ/Uu7JylPzTMmMpmHtu86N6ejohx
         aecEME8oRIfjE6DfR9J+/V5wezjobxh0nehq+JZGCMYlTQsHUoSiAxvchA8CHKmCeGr7
         kufw==
X-Forwarded-Encrypted: i=1; AJvYcCUigod9RRUzzGlzAJuPtUJNCs6fGKX5y7naQsGxlsh+My1bT6bZj7gXe0sN+KrQCHqYDVBqc1lM9d/BPpg=@vger.kernel.org, AJvYcCXaUnzd15HNk3MWlVmCIolObn9NWgnxg9HP60NNJX5MSz57AOGle+Sdw2VGYybeRUz2IAeifTO/6gjlkc0O3Og=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGaerogbCWSEJtXx8PRwt7G4ox6n8qHY3H03NDgmQXQmY/7+H
	iIW84CNZF4LYZEiWX4vYTjDT8ck3HJocr3oWF3DD1+eAP/rlkxJB
X-Gm-Gg: ASbGncu5iKqxA5K1SQ436wmFTz7YV/Hlg6IiJx0xSc4xwesb9cwSYRA1ozJfS47iAUq
	OrUgtf8hE0uV5XUgsubR5xBZ8Rq7bfx5Z0YeHGKVObpSui3RWLjSrspJYU6abFM4kpvJx6b6ydX
	TqhIZWq2OKPI/PgpsMhN2pU0Q5Nt8tHrRYE4mGYARpo8aiHdNlfPEih9+jQrthvGv4tGzj8TIRA
	xZAHGpUT0a11+sdYAwWWa6khYWzW0CPWMNjP9qpLJLrLVsIX6clm6di8938Z/dtvh4z0LzwNMzL
	4f2TvFR5gEFcV8PyWtKrEekHxmY7YaIVSuQ+I7YlEe+sdHW7CRUSbD+E/y4W+BLb4JvnEjvPeFs
	Rn9x5GFRY/d8Dsw==
X-Google-Smtp-Source: AGHT+IF1Bb1rptBpuPdUkW2OAkIn4AZYn07KmyxeIsJrvEXJzqjsDaqivcRJcoWPQV5mBelNcvBxvw==
X-Received: by 2002:a17:90b:2552:b0:308:2945:3842 with SMTP id 98e67ed59e1d1-30a7bb0ab62mr4671711a91.15.1746534712352;
        Tue, 06 May 2025 05:31:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4747719dsm11060910a91.19.2025.05.06.05.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:31:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7027fc8c-80d7-4d52-bf94-ad282d66e729@roeck-us.net>
Date: Tue, 6 May 2025 05:31:50 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: apple: set max_hw_heartbeat_ms instead of
 max_timeout
To: Florian Klink <flokli@flokli.de>, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506120111.5041-1-flokli@flokli.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250506120111.5041-1-flokli@flokli.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/25 05:01, Florian Klink wrote:
> The hardware only supports timeouts slightly below 3mins, but by using
> max_hw_heartbeat_ms we can let the kernel take care of supporting larger
> timeouts than that requested from userspace.
> 
> Signed-off-by: Florian Klink <flokli@flokli.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


