Return-Path: <linux-watchdog+bounces-1420-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C77393A219
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Jul 2024 15:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 877991F236A6
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Jul 2024 13:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5495315380D;
	Tue, 23 Jul 2024 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czeE24oU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7237313698E;
	Tue, 23 Jul 2024 13:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721743083; cv=none; b=RcGQmgj3Q/HoOeWzf5DvWsSBMqjAgGZTYss96UpZdw7H8y5eKkMIeqHft2tmfS6I3Y57yNo/mS0kBVmP6BZXnKvv5XELmE166IVigCwewjA/ybDFbDjttQXp0m87GIa9QW0Te3MevJcx4UkxefzZkhrIbs3sYjaOBJ3krgeD6hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721743083; c=relaxed/simple;
	bh=Tqg/mRP33sghqMs/WD/CVM2Fdu+Ue+osODMI05da5S0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVMB6asc7eklRJhCVfaIRgugvh7R696Qu+2fKcCljqeI6Ea+syEWK0kdgYFGob53ItK5GGSXlWxb8X/6pG7zipcAXviL9OzNHdCUU/4jTm9VVUrhnir3vAcpwd2nxw19EDWff728jT97pEz2aB1WsJisoR5zDA3vy/kXkntvjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czeE24oU; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2cb81c0ecb4so3098490a91.0;
        Tue, 23 Jul 2024 06:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721743081; x=1722347881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=glL/MXWvNCQhnTo0a4PeMJsyu3UmSgFct4D6KzdzJdA=;
        b=czeE24oU6Lb3+CfQ//3cfUBP0CfHxb2vIXoYkfmKBdQotUAyewYeNrrOH0wmf0bcoX
         1dJO1BiRY2kx+Ayiy7YOp39yox1t5vrvMNsDzii9Cg5QFFx4zVbr29s9JGgj5ncfXBy8
         iD+oOi4S5sueeSRYxiUA2EMuqj1uO/v12BPrtfDQAWN9pZNSmQXTEAohHlqNBcTfXbs6
         wAxohtsDb0+UwEY2xQmsunvI7r1ZHKK0VOIKjuXk7SiWASUD3cQTph++M04nACpQNdJp
         aWVoNnqt+6k8XeVqIwBp3Fwcqk8tg0cXKVNOWNICUIPGOUOrDiSWDlh/7aZuVGsF9XxY
         u+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721743081; x=1722347881;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glL/MXWvNCQhnTo0a4PeMJsyu3UmSgFct4D6KzdzJdA=;
        b=hQkDpNUCnR6xRLZ9f6pb8hAzRblnyaW1NXOJ1g/7MBVOIV0CZwavpL0PEcFQ11+Ecs
         O5ZO5rxPupuGnT01ZNGkQSWMZPfATg7NhXBxExhaGYDBkH/WW0OpvmPqt0CmniSBDdhC
         sTuzdds85yln/WgDCrZgBNWl7Pwz4Gm6WW1opFo8IznUiEzD68ifGjcp++UcLjFil5Qf
         njYWJXmmIH603wZBVOWPRLLQDcFkXyJ1cSviAnYT5JaHgthsbBVNw+JyDscA8FMkZ6ZT
         vaZcrnfpJsK3yQoyGNqQLOPjcJNMMJMXF1DeWP4bjvttT5GKgiMQ7vGYfAjhxRrmsubo
         Fpsg==
X-Forwarded-Encrypted: i=1; AJvYcCU0GPIHa9GeijQegUfhISuIWg4Meri+i+89EFEZBwz4ndDoGWs5pECholwsn8XR6QilwS+cNYQwUQH1RaJFFjDypPgP7A+yj1B77xnPmX1GsTuC06waK/GRTNdwe+Ls9w6ae3P82PTxZ+sileYnwiCIkhvmemOQb9PsUHntoSG4/96mcDUjqVQ=
X-Gm-Message-State: AOJu0YyRfxMcSIWmbkpXqkHNEF/x+n83Ypvf4egsMBmI3PuInTKmq5UK
	YYfQxQgoU1SWMk1UpDwX/NdeTOEgsEgN5l60OZIuUJO9qM/hA1S+8bMeNg==
X-Google-Smtp-Source: AGHT+IEgJvFcPKZvb/pmtj/IlP2AW+3FPJdctk8gH8JF+Dxn3anpRuui1zPtJ5WCl23Z7XxsK1eb3g==
X-Received: by 2002:a17:90a:300c:b0:2ca:f755:1040 with SMTP id 98e67ed59e1d1-2cd8cd51e66mr3340572a91.7.1721743080641;
        Tue, 23 Jul 2024 06:58:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f436c6asm76621295ad.206.2024.07.23.06.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 06:57:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2de779a1-be76-4aab-8440-9b01a2cc22ce@roeck-us.net>
Date: Tue, 23 Jul 2024 06:57:58 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Capitalize Farenheit
To: David Hunter <david.hunter.linux@gmail.com>, wim@linux-watchdog.org,
 corbet@lwn.net, linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com
References: <20240723131849.264939-1-david.hunter.linux@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240723131849.264939-1-david.hunter.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/24 06:18, David Hunter wrote:
> Not capitalizing "fahrenheit" is an extremely minor spelling mistake.
> This commit fixes that.
> 

Please at least follow guidelines for submitting patches, specifically

"Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
  instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
  to do frotz", as if you are giving orders to the codebase to change
  its behaviour.
"

Guenter

> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
>   Documentation/watchdog/watchdog-api.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
> index 800dcd7586f2..78e228c272cf 100644
> --- a/Documentation/watchdog/watchdog-api.rst
> +++ b/Documentation/watchdog/watchdog-api.rst
> @@ -249,7 +249,7 @@ Note that not all devices support these two calls, and some only
>   support the GETBOOTSTATUS call.
>   
>   Some drivers can measure the temperature using the GETTEMP ioctl.  The
> -returned value is the temperature in degrees fahrenheit::
> +returned value is the temperature in degrees Fahrenheit::
>   
>       int temperature;
>       ioctl(fd, WDIOC_GETTEMP, &temperature);


