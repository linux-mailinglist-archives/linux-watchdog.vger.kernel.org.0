Return-Path: <linux-watchdog+bounces-3385-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBAFA9B046
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Apr 2025 16:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DBEC7AEE69
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Apr 2025 14:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7455819CC0E;
	Thu, 24 Apr 2025 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uzAM9zOn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D68B17A316
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Apr 2025 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503927; cv=none; b=olalQw9njMn4z9g5WCnp1/+VVyXz5Uw3XLOh33WjMys6EpgQwgoRKt6iKpkObQoa9fIwrhnl8WlLz30xz995XjqKWDGJZoFWoQQvHCo1/ieRn9Zm02B6viOg3mpAR8VJmvvSq1YCIgSNCTSlDoredSbcRxhab3sCfuO4fXX2hhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503927; c=relaxed/simple;
	bh=CtEiAcc/nNoaN3GI5PvoThuoQG72iKhqq2zgIqa7tYg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ydk1dwkKObtQN+jzmvc/fXVO5Fx87liZeM8jTJR2R504s0moiwMaAavDKs/uFRSHZbJTYdsRMH1ARv9kVLrBZV1ITs1cvoVFaufNFie4yqN8Aaa1+3Jo8xXzSvKU8o0S7uR6OmbblonXLegf1k9EE/7XqRzOC7DghVSYjpTmllE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uzAM9zOn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so10367805e9.1
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Apr 2025 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745503922; x=1746108722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMVKepFY++CcE6uPsrs1OkWWcrChDnDL5Zv6xP0L1IA=;
        b=uzAM9zOnbe8AqN5bWqXFQuouPRDdx/ZXawPUA74CoEdORcPETsCEzwIr5N64TmWB6D
         EOZKEU9DtL4cnRQOmYpwNgL5pqsYuVod+FJpwjkugjd+kPDIR8Ili7f8O+KS9ugAmWXh
         lusUFJWbfaYCmsNbQp21pdW5xmxD5F94Lg+wNQfOgTmFfOSCOanlKINeUdw7KgZCBzdj
         aA60NOLNh0T041uX37RminswwzfrslF3cHXBHX83J4BVLmEpGgjzqu+yb26rSJBG4nCT
         G2ObPtzd6qqHZHGQsqjNaKuM64pm05HlXgc+cosQwVNWDB/YxrYj5j57W3MqqHyL7NCS
         hZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503922; x=1746108722;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMVKepFY++CcE6uPsrs1OkWWcrChDnDL5Zv6xP0L1IA=;
        b=NIzP7WT30FCMBe/L9lTBPhSzkJgrg2fV2zjEOiPEWPmJuf+F1thjmWOB6MLx8aw7Pu
         NUzD+jXgRSi6K5EEHmcbPZHb+v1WKcFi0QYDTeBuZbwPGnZGpEUT6zzlJ2X9iY5b9qDa
         nC5kZdBHz9adX+e+bEcMhyot6rsvRjqKWYBcAp9D0jh1VJFoGUPNCuvuLgn9MbgzXdLV
         wfSwSKubQYjQPLksWpxvigvs4vakRud4yIWCH/9/waQst67nwntFF3rQZlE6TajupEvK
         oAD9D1zRQpGGN6S3daglZgu+/SHvegVPPIaO2DtIeEY92rN0FuvFPM2pzDPFuteTOHZJ
         4iPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYhi4YrJGYuhQc4RlLqklgSpqafy8KV6aVhv40pdch4ZlMzkrQN61PzS53TZNiECPCjq8FJjcRwnu/dPLk8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIfrBltCGGHBHy+8VlRZ68hfz5zEWj0g5Isfm504CNxhkCLQUt
	1oZmDfW2txGxogJ+KNeQUWPjyK8yyvCbj5UIZ+9ru30jqQCwusPv2Euo/S9vkws=
X-Gm-Gg: ASbGncv0/kNQ3FPHe2FduoGkmIIuNFk07sDprqabMzcBkwpWTsbDEcJwRaF8wBhxq+n
	BzrCRSkq2+GSYigkxG7jco0SSk49/Z2Jravu9b42I9qa12BAJaWgiIDc8VPuUNP0M87kWxprvq2
	0vmw7SU7/M1yvIzORaQgg3a7A2r3DvlCGgfXeW/HswSDgCz/k1jLUOUE8RUQ1GD5aYWR7WobrES
	uqsQqv/RVAq/UzOKvq0eC4dJEx5kI0TPoASiIi5q21VsyUH6+h7d/57sPpw40eadD5MZzNVZqqL
	cV4CUrC9lzLalTYHfQ65rDLoIvsp4JWa4jswd8P+AGgkuiPyIGdReZJznwqQmipQAZx4nZUhw+6
	ZrIZ0bI5hnYZdtAA=
X-Google-Smtp-Source: AGHT+IHDAgJu2/VSQFzrBijOYgsGceJrM3M9BXgk2UdJQTMK4wICpOgpqmOlkNppVo8F1dpEn3P2XQ==
X-Received: by 2002:a05:600c:1f94:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-4409bd76f5dmr26518185e9.22.1745503922448;
        Thu, 24 Apr 2025 07:12:02 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4409d2b86fdsm23700385e9.27.2025.04.24.07.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 07:12:02 -0700 (PDT)
Message-ID: <d06f9e32-0c53-4ec0-8e78-1eedf5d6e2fc@linaro.org>
Date: Thu, 24 Apr 2025 16:12:01 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 alexandru-catalin.ionita@nxp.com
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <20250410082616.1855860-2-daniel.lezcano@linaro.org>
Content-Language: en-US
In-Reply-To: <20250410082616.1855860-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Wim,

On 10/04/2025 10:26, Daniel Lezcano wrote:
> Describe the Software Watchdog Timer available on the S32G platforms.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

I do believe all the comments have been taken into account, the driver 
has been reviewed and tested.

Is it possible to merge those changes in order to have them available in 
linux-next ?

Thanks

   -- Daniel



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

