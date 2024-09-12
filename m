Return-Path: <linux-watchdog+bounces-1880-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF35977370
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2024 23:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D12B21C214D6
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2024 21:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C459318BB80;
	Thu, 12 Sep 2024 21:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/jcHDgz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B84B548E0;
	Thu, 12 Sep 2024 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726175758; cv=none; b=C1gnTn0PcvHoHOQl+L5HYJuAb/5tY8LuxeWWd8iCsGKWQbIp5vp8XWq1Un8eNF1nUkxPVndDitQf4H372NtS+gRbJIZqatDMMDt20uT0Ad9XRGeWhEF9TuVS3eHV9f3N3Vrl3qzcVsNkMTDZLzBgkfCl8idCbPCdNfa1QyKEAUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726175758; c=relaxed/simple;
	bh=w45kFhbtOblz6hrNrwals70xyTiWgU0u4oHrmw7gONo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFIvkSTeAcVQ/Axcps7L6oPz7f3HSodubiHD6lA0axd+kekU4gTch+gK5/WAzZIVTsPzv4VwXGpgrFzA0Z5jKk2uyQxXHGORvI91IBXL+VisnIV1x1otHVr1DP9QidFhufBSGmtOqllNwyoe6XtRVXy0dps2xW6jjtt29hF8DjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/jcHDgz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71911585911so1245292b3a.3;
        Thu, 12 Sep 2024 14:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726175756; x=1726780556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=J+V/SKmtoNTOu9JBLVfLgw76iJMJHqaec3jY8eBRImc=;
        b=C/jcHDgzWFKbR82ygV0j8tGoES1G9MWLZQPNDDZQ+H4DViX6F2Uyfv0ujupXQkwzaJ
         1rXtoTM5vqIQvPuSIGGGNVBA15fcE9+E+hPk05UVHyrHm1UJJlHHS6vhWOCrv3pTigYm
         bbas/XGGuGFIesRW59ZTf6Jo/oBjc0tA0ICGdJUQiOL8X8jmK8yafqnAdlDkjtpxSCm9
         TVC8+oI8qjv8EMEBBwP/ft5d+THosDX3ObSGeccPlHMVzcdhZJoBlZeLKT7D5+3wl6au
         mRV88qbkXexacuH43xRWFIwgTwgBA7vZWNiT6V/8m6EF/36wNmkl2qvrw/D1VIdfwgt2
         Zjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726175756; x=1726780556;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+V/SKmtoNTOu9JBLVfLgw76iJMJHqaec3jY8eBRImc=;
        b=O4RW+xdrbFqwAAyLDZyD2dv9ycW2TvSa2H/TG8qSmizPuLZND3mrYK+qYa9OYx/u2y
         9NE31to7HHYzdbStvEIhQgNV64S7ooRkdimw3KXwUZN1nnOEPjJdbKlWLooxmUGrwfDF
         SgG+r060rgdr5+QNQeqCHIgXTbONB4qpTSNnl7ksP4gTiKzI6+xh+jkgeUlFmRW57msv
         rURj0ALHrdcbTfrzb/SE4Cr5qun/8R06FHTQrtzdg2suVTOWCXF5kHq6FUoDawZlgfwZ
         KBc5JRLmlJNQKwSJLiW98DbB7dhaS+AlvI88bmwCDSJcDmXWzHlVJI57rcbOBTDH314j
         +FIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW60WHSr7vbakRbh81c4E+Z4afZP1Y1iO83PEa69YjF0+KfWf58h/wqblhO+TKmf0FBKBhRcWG3p5It4do=@vger.kernel.org, AJvYcCWhbR4bJ9AmQeAjZLoBYvZXCBtFveIjGR11gG0LQljbFA3LtLWijD8t9fvUyNq9lH0bLzX6BOv/k7HuExUfDZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuxj3XRpQixw+gfepD8z5xV29s/NvQQb6f7XJLZKOfyWGjthWW
	UEfhvNaGf+qDh3opZZ+vKKWgDEc3I6IUrF1CyAHpgSTDjIoIZGLU
X-Google-Smtp-Source: AGHT+IFtZQwVAiKGWLSsA9/OucCp1ev6NRyH09SeqMNSET9MsvhbUbD0/7MT6fulB3jFFwL/3WLYAw==
X-Received: by 2002:a05:6a00:815:b0:714:2881:44cc with SMTP id d2e1a72fcca58-7192606d9d1mr6507994b3a.10.1726175756407;
        Thu, 12 Sep 2024 14:15:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090c37efsm4987079b3a.187.2024.09.12.14.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 14:15:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cc652ed1-32c7-4ea2-b494-698b344f24a0@roeck-us.net>
Date: Thu, 12 Sep 2024 14:15:54 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit()
 call
To: Oleksandr Ocheretnyi <oocheret@cisco.com>
Cc: jdelvare@suse.de, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, mika.westerberg@linux.intel.com,
 wim@linux-watchdog.org, wsa@kernel.org, xe-linux-external@cisco.com
References: <9afcde72-6720-494e-9a02-b0089253c121@roeck-us.net>
 <20240912141931.2447826-1-oocheret@cisco.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240912141931.2447826-1-oocheret@cisco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/24 07:19, Oleksandr Ocheretnyi wrote:
> Commit da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake
> PCH iTCO") does not mask NMI_NOW bit during TCO1_CNT register's
> value comparison for update_no_reboot_bit() call causing following
> failure:
> 
>     ...
>     iTCO_vendor_support: vendor-support=0
>     iTCO_wdt iTCO_wdt: unable to reset NO_REBOOT flag, device
>                                      disabled by hardware/BIOS
>     ...
> 
> and this can lead to unexpected NMIs later during regular
> crashkernel's workflow because of watchdog probe call failures.
> 
> This change masks NMI_NOW bit for TCO1_CNT register values to
> avoid unexpected NMI_NOW bit inversions.
> 
> Fixes: da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake PCH iTCO")
> Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
> ---

Oh, and change log goes here.

Guenter


