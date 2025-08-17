Return-Path: <linux-watchdog+bounces-3998-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F6DB29369
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Aug 2025 16:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 689EC4849F6
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Aug 2025 14:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96AD723182B;
	Sun, 17 Aug 2025 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTNUObWq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1E61FDA7B
	for <linux-watchdog@vger.kernel.org>; Sun, 17 Aug 2025 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755439789; cv=none; b=riPrHvSOKequRN/qJEzLoFcNivqR9dCQpMrD0yEhVPtPGJppkZzxS9GRHAjV9uLF6nF6eu42uRufFQX7/HwMaWc6NJ5yIjfAVmGc/oxpUUB400TDY0od9z5IHz0NH9xApflh3bS6BvLd2q0OKAAbzGo0u156IVWBB8PtXD0bHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755439789; c=relaxed/simple;
	bh=ulfKMGpPgYOTsex8vF3jdEAElh9gvO4mtFlMnRHpgnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=BV+ljnCVzdKnjBTQC+U7WdsrMH99uKBEi//5b/7B9cFdiI+VObAU2aNaXe0tc6TSx8HlF/YPYlxovvhZlz+SP4ENXTR3Ufoxhovlki7ZeM98V1v6TQQgXN56wmcsixg+/L28cXCbLvhSOb3Hd2S5EVH5SlB3Gh/isMlNo2FaqqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTNUObWq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-323267adb81so3993712a91.1
        for <linux-watchdog@vger.kernel.org>; Sun, 17 Aug 2025 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755439787; x=1756044587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lGoJXrlpUX1hFUMuzvwYNA+2gjlSWvogmgGw5OsMmJs=;
        b=jTNUObWqj8BvZMdyQfNdXhyvcy60WNSjyBp/7yeZNxbZVlULdhyzriZ0qRF74PhgN3
         OCApGx9HZePORE5qsbMUYCYvPTIvdGm57ZOzgySmLxqpUJ+NCJg4zsvKXLBo1m08YUO7
         GAcvgnpmYmEt2U4c7481iQNi7imKbUtkiy9YJAQ7vMTeB1mgcDJEzNMloCsnLE9D84DV
         Pi4Odw5svkdq5jx4nZIfDChCtkPktP72k8xBP0eoMTVoxflRDXS0iKEZsKwphsNwQPFs
         914w0itK/aAeQnS1l2qDONdDSCeGzticO37s+sl7cVSZpmKZjwGDR9+1XMXIoPAeUR9W
         uQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755439787; x=1756044587;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGoJXrlpUX1hFUMuzvwYNA+2gjlSWvogmgGw5OsMmJs=;
        b=rP2EgUQAdMBRxTv8Lgfup3b2S2aKDRMABK+KeB0UkG3JRpxBxInlm5sFjWX75Gjw4g
         ZaVZSl0Zf5sRsajjek780zKMejTuJKTePS05AXQQGOBfh8OKm4dq3w7x46ohg4RrS/5u
         VO/e5joQfyvJqLR/BEtjjrIkzTKznui2nExDfW3miIWGfDtL2m8iFYHi+kWx6ZLbBBLm
         ouJstxaBRtbz1bsGwWs0G2fgiv7gDTLVtllfTuAkOUYachd7ws84eM/z2+AduR54ramP
         KP2r/RtizZZl369fIPfsReQMW4Bk5AQjgzoV+JWcqhtBx0ryPH0THgR5UMClfCZn76FZ
         6UNA==
X-Forwarded-Encrypted: i=1; AJvYcCUo0tpjVhtTAhcw3RWFVZgl6izIEM1kUjur8mykSU6HegLARXL/BKpiMTZEsV4x9OwOGKSmJIGsb7noLzns4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN0unnZuk7UScrTkQd0BJ6vO/RXhZ6LOWIxLOMp+QjIe6U1qJO
	juIgYlVI7YdsUNnoE3QD11EhHw7qNk0AG1Y63+4n8LR91u1hoKIPmFe8bZxKVw==
X-Gm-Gg: ASbGncvt7t+z5bnFsU0IDSpBOf8YlapSUSf8VYr054DWW9y0D2sxXZBMTKywtGQiUJW
	qb8xhNeL7LmUWTpsA4ZcnxIILR2h6ssN00goBycuX2GFadZZ4w8SQRgjsNth0MAzLuoBeRmvu22
	TBP34WnKsl1V1UnzaLrvMIfYBI3m0StEKZgEPw/Q8/6ZU+/5sxTkCfRNyZODoHGL/gvd3fiRaId
	x+f4n/d03uwzQ4RyOpaLGxtxgYzg1ZIgliZraVFQoQvlGrinvQ9b/bNY8W7Pb6V3I/+TM9EqVe6
	sl3gTQcKpQVyzVUpVCLuh5g/Q0X+9Ul5EtWOu9zBYOigZdfrabJ0Ii1afnKD4K4adHl/1vBMU3j
	x2rlKWEU2xzCLuBFHAqsCiMJeyAhzPFSNd1UqzzGo4Lo9wkvRyGZcipmk5dKQ7VkDv24snt5DUr
	61L21EjQ==
X-Google-Smtp-Source: AGHT+IGIwSlOdTHvrx+TbVy94r9HonVes+2ZepsVWqTN0+A4/b0fuRSEHMiFA8k9tyQZhAElBSWovQ==
X-Received: by 2002:a17:90b:544b:b0:321:ca4b:f6cf with SMTP id 98e67ed59e1d1-32342181787mr13059070a91.35.1755439786644;
        Sun, 17 Aug 2025 07:09:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439627c5sm5587412a91.1.2025.08.17.07.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 07:09:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <080da693-87ae-4d21-bde7-9580c27d5268@roeck-us.net>
Date: Sun, 17 Aug 2025 07:09:44 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug with intel_oc_wdt kernel module
To: =?UTF-8?Q?Petar_Kuli=C4=87?= <cooleech@gmail.com>,
 linux-watchdog@vger.kernel.org
References: <CAFbNFpBY-wrxjD0h8hjGnHFirn35kWfW-ucoX-wAVmR5SHjARg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
Cc: Diogo Ivo <diogo.ivo@siemens.com>
In-Reply-To: <CAFbNFpBY-wrxjD0h8hjGnHFirn35kWfW-ucoX-wAVmR5SHjARg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/17/25 01:59, Petar Kulić wrote:
> Hi,
> 
> as I was pointed out in this thread:
> 
> bbs.archlinux.org/viewtopic.php?pid=2256738
> 
> ... I'd like to report a bug that prevents me from fully booting my
> Arch Linux install unless I blacklist this module.
> 

Crash in intel_oc_wdt_probe(). Copying the author.

The watchdog may be locked, and

	info = (struct watchdog_info *)&intel_oc_wdt_info;
	...
	info->options &= ~WDIOF_SETTIMEOUT;

may trigger the crash.

Diogo, did you test that ? You can't override a const like that
because the data structure may (and likely will) be in a read-only
memory region. The structure needs to be copied into struct
intel_oc_wdt and modified there.

Guenter

> My config is as follows:
> 
> OS: Arch Linux x86_64
> Host: HP EliteDesk 800 G1 USDT
> Kernel: Linux 6.16.1-arch1-1
> DE: KDE Plasma 6.4.4
> WM: KWin (Wayland)
> CPU: Intel(R) Core(TM) i5-4590S (4) @ 3.70 GHz
> GPU: Intel Xeon E3-1200 v3/4th Gen Core Processor Integrat]
> 
> Problem started after I updated my system with pacman -Syu and kernel
> got updated from 6.15.9 to 6.16. Same problem exists in 6.16.1 kernel,
> but as I've already stated, once I blacklist intel_oc_wdt all works
> just fine.
> Let me know if you need any more info.
> 
> Thank you.
> 
> Petar
> 


