Return-Path: <linux-watchdog+bounces-2234-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 164DA9A40FA
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 16:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAB2B289550
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 14:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204E118FC79;
	Fri, 18 Oct 2024 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqkPFcdn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1707D131E2D
	for <linux-watchdog@vger.kernel.org>; Fri, 18 Oct 2024 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729261175; cv=none; b=Mbj3po9tldBujWyFNXTXyxz/wtG0zoGWmdjGk6FWYprgkhaBlk0mdNw3qjNG3NsR2fWE9ByfvHiTEq7i1s62isATJTLoWGEK4I4A8yarFFNoualCX4QP/cjMXKBluha3S4031gExaXGaV+4PJ8SrR25lrL3N+TfiNWB4CkwAtOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729261175; c=relaxed/simple;
	bh=LGBi/C0xWuqcAdTejXrYR827GxvpYJLE8zih9dNPHnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxvvg9lgUbz3fDYTlb684YXAIG17DVnzusGN+Foc4h+rDiy+womcB5FXEqj7lW1+rQEh1FGhTyX/sU0cNPwGpdha3dIGgUlluepLyBZYYHC4vkIn2S9VJeiLWccD2xPL8c4QqvtrMiYfD1aCl95BIooSxofPaxf8uFijnviho3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqkPFcdn; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e18293a5efso1520525a91.3
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Oct 2024 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729261172; x=1729865972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ENTVM6UXDwZWqnlMzTnBcqtPSPowHhAVk4ZrtXYxXH8=;
        b=FqkPFcdntUqgjJUD1sfqNmirW0ydTyuKqFxFESxRVUTz8KFghgbDUiTeWSIUem4ewb
         9cnWeo1Xnge1ZAaBTHeMv1tLjP2Il9N810Pt5F46Vy/ZrYdY5bJPn8TjCuBJSSPmPR76
         k0mDB3RJ/2tGkNrtzKK9EN6eAQVUBjNf1G6DYIqtrEGOyGzzAp7C2rh6eKk3BZeTHleY
         jCpxPn1n/keUb/iVf4q0Tj+lYTcJttiMNyO0ipjDpC5vuA5d+Wnq7/F4joJfGpuIv3jo
         ehvEi1PqFJN1wMhx/uXSNASPArMkzhYd23/D0rf/KuIKZjtPD/jczNrNkZgCspQaQ0wi
         3yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729261172; x=1729865972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENTVM6UXDwZWqnlMzTnBcqtPSPowHhAVk4ZrtXYxXH8=;
        b=iNv9t+Uq14xQED7Du5zOty6AllmBJoifs1j1pyGAbT+WYb2Bbc4l4/tZl+4uqR5EaI
         5FMCIbjOFwRVdMm32AyZOhykbQLhb8eVl4NWGrnqrj+JxQ2TNyNbqkA1Bbbb1auKmcZd
         rvFnrPsdhB8PJER4BjsOFLWpBrE10Qu/agyNoACJ8yxnoBA6qeyAvbMAfrjK74x/xFtF
         bp8VdC02NRnHQZCrRPPXDRG/eM4kENbC3kxLgvQuPCCIXDfAQ/QTPr9exSvgMd3pmUdf
         ELk8X/p4ozNjWEwud0MFQigo4avBYXIEUQv90Oxiby+vPHtk77lGt353R6sFSLFu4hFZ
         TaTg==
X-Forwarded-Encrypted: i=1; AJvYcCXQu7tGEwJHQabfGBBa2DC4JMrsSjRDdfMf5IZek1y1KwxkBmolLcat2c/qsgLWOvEfw8sZN8cberH+z9xm2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8aLxUfEr2gQ3kU+ZeRZL9EzHUxWPr1fyJFwCS2F8IwBUIHo3s
	zCHl8j5NAg2wY96vTdqNCoY+9aUEIpK6wqJDaDx/LPaD+Y+JCTO/WdBMpQ==
X-Google-Smtp-Source: AGHT+IGGcg6EWz4cst9gWc0gSHaQlcSLw4hLuIKkWL3qydZwU8AaJZhLU6heHYueTCTe6M0WUzSp+g==
X-Received: by 2002:a17:90a:7406:b0:2e2:ba35:356c with SMTP id 98e67ed59e1d1-2e56172c2a4mr3110364a91.39.1729261172204;
        Fri, 18 Oct 2024 07:19:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d7c21d9sm2106952a91.20.2024.10.18.07.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 07:19:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <25cdee97-dbe3-4d20-be4c-61cd9b6be78f@roeck-us.net>
Date: Fri, 18 Oct 2024 07:19:29 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] watchdog: da9063: Remove __maybe_unused notations
To: Fabio Estevam <festevam@gmail.com>, wim@linux-watchdog.org
Cc: support.opensource@diasemi.com, linux-watchdog@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>
References: <20241018135821.274376-1-festevam@gmail.com>
 <20241018135821.274376-2-festevam@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241018135821.274376-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/24 06:58, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
> handle the .suspend/.resume callbacks.
> 
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> to use __maybe_unused notation.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


