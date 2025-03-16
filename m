Return-Path: <linux-watchdog+bounces-3111-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D021A63355
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Mar 2025 03:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D09E3AF681
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Mar 2025 02:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E953FF1;
	Sun, 16 Mar 2025 02:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j983ouKe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E0076035;
	Sun, 16 Mar 2025 02:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742091709; cv=none; b=CDkxNzvQqUXzWkmMyJlh4RJ6mCCSNA4q4rAoQR2CZ4e39Ece14Hxe5GysPUbuDPzxUZ/DAW+ngLSbwYK8be2i/zoRgK47Wn0l9Uej1TOq5+9h4ySowfT48tSBOctp4PQeOeXCgzUZoZIGa64ccjfqwEQGXrHxUrGczMMp8YhvjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742091709; c=relaxed/simple;
	bh=DKWbLojXTC9FWzkVFTVpDI4OwAWggqFMDCv97VjYybg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxuJbeSPyRYKRst5wi+RTGV6nqK7S/j4pYzQlFHjjvkvqh3k0GCkF7AkWH6S2FPBz82rjqYnvWlaBYGsjRh+spOMBv6cPXeY7Kh34OxQKLYxsnIJDzl5EV5kIpsFkoYH2jqdgRbiLIGwk7su3b15y0BNeoIU1+aBKHPpoubY4OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j983ouKe; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso1436195a91.3;
        Sat, 15 Mar 2025 19:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742091707; x=1742696507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xXQAPce9+Da2Thb7jFtKZNkgNkWHZYB4UCuGYADpkwQ=;
        b=j983ouKeVLZUBKKCy5F6HUPNTcMit+3O69viszCkYPmfiLBHP53orhjun5A+O41b6Y
         NvxKSJGTaHAAAesK1n68CEMrztPptiJgv6QnELS2HeBM0ZjyoqVFrHXc6xIZppKaZou8
         vMWg0N+F3RcJIlK9Cxch1V43Xbbwstkh0qjKeU3OBw7iXbE+DosMk7LDLYPO4CfoM1Xi
         DMvJoQ47Hl3yb8j4bmgsk+k3RztUsn8paqShhGtSuKlkdGwv2gC+N+FNUGMaVRvP3DLv
         8cMwHeE1tcpsBTkvSMD3FEP2aMdI0T3ovf/tu+OqmOddPeEzZhbtP5+z+9YXr28h6WLs
         NKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742091707; x=1742696507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXQAPce9+Da2Thb7jFtKZNkgNkWHZYB4UCuGYADpkwQ=;
        b=jEoh5HCTU1o6wmb2nM68y1fTOGi0TSMvHHYkrQ7c6JBccKoOx4Cs2HdimxIrJ+WVf8
         OuoUTpotEwaBiTvl7MrBblbUt+RWZ+vuGF91/p7XyDdhHqnc1FRdbPofjW1TfMjqIuWR
         1Bx4giiMmPwexslFDunTdpRC6/u6AEVEuJv4Uro9c2wvrGivSSkvtT2ae1bjdMMC4mh0
         fDu34GB/znSzUIhjQVu9OfDf0qBEjaQXU2A78NzVdUlltXKXDf05shNT4PnHSJkkB81M
         vNqsU2aWoZJtFsmbACtuTlT1uh+blkuTc5w2dwvpK9YPsACz/vpUWlLjstfX+y2AcdjD
         ERGg==
X-Forwarded-Encrypted: i=1; AJvYcCVzG6Euy90sCk4C1lR2BvRHUUXgG9BEA4xCPuPPd98giQtJRBttmwYO1+52X8aM1r6HZzDQ0nea8selGNffEi8=@vger.kernel.org, AJvYcCXoHLD4vSV3kiGVukf9gYbJDVzBZivzefnYY3fv2TmJZvLZs8S/u2fwGrKY5Kd4ofWdrftcC6Y9xWypAzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzG2TYnqBdeyIve+OWLZjY3gc8YHMy4JTHVYalVjYGfK+jjo5S
	GxKolPGaV2Hezk7G+AtACEfMbRp6SvVbOPTQfmqb3va3zVdLhh1A
X-Gm-Gg: ASbGncuXQp5ipSIZYLSmwyGudDdnNAJ7T/yG/Pn4aNB1LFIYJOHhEDjEbYjvf/KEiCH
	d9peTuNxd1VZ+3WCFr06vB/0xDMijvK4C7Jm49PXgbGHCDMomkinjto8W0Gs5NgGIzrwD8Qjl73
	sm3AVRfzMWoevWwQzwMEAnJCz8YBwYRQ5xFrN66gMV/MqHWZYaU42t5+kG4yyUCt4vKohHEEe+0
	9iLj92wXQG9z11YjoLGVRLll8BQmcZ7AMmpTaVrWITFq4gmvfD72sYTCkbuSpiji5WmdXrFF3+l
	MIvW/3e5Xzle0FQ3d+IvqpvB0RFlgfoZjqTV8vPm3Ef61l9/Y3SCsham+6jNrB0GqilFUUwcRGy
	EDTohVvYOy0Z3pP+pgQ==
X-Google-Smtp-Source: AGHT+IE0mziLQreGnnZV71L6sivPFlpL+qS1/vBuZT4SLTm3FCRnBzyGJK2nVb/xaYlLbDuH4z2uNw==
X-Received: by 2002:a17:90b:544b:b0:2fe:a336:fe63 with SMTP id 98e67ed59e1d1-30151d56e54mr10094445a91.24.1742091706698;
        Sat, 15 Mar 2025 19:21:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153385044sm3746653a91.0.2025.03.15.19.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 19:21:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bd23b8f5-2b9e-4f23-a7ec-3d68b96184b5@roeck-us.net>
Date: Sat, 15 Mar 2025 19:21:44 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: npcm: Remove unnecessary NULL check before
 clk_prepare_enable/clk_disable_unprepare
To: Chen Ni <nichen@iscas.ac.cn>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, wim@linux-watchdog.org
Cc: openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250313084420.2481763-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250313084420.2481763-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/25 01:44, Chen Ni wrote:
> clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter.Remove unneeded NULL check for clk here.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


