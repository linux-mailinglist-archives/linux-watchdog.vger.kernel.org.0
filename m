Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C69E688088
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 18:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407442AbfHIQwK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 12:52:10 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34742 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHIQwJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 12:52:09 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so45219863plt.1;
        Fri, 09 Aug 2019 09:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O+nfQfUaMACIDpLI1zl3ljQDTfG64Jwg7wf2QochBqo=;
        b=ds2Z5YV6ZgUP1nBp2sWI/rTb2MHebksvTqZdBmwQNRh+UouUyEwGBnTCqU6OFzAA1u
         gHQo3Rd7jRise9U+4/09kUKvt0R6HAnYA7u7YzFoiPdV4x97gnNO4vLvksy101chmToa
         SoghHE5CNzouHT4Clxf6c8B789Jr4I1eWlYUQ5DhQdd2Lds7hXJIk/qQp6b2bXkEoH2W
         K4D5ZYGS3PD2sJgXIPWcHoRDDOvyItM4Eu/3ZOmTxUaaT25Jg+hk/+p4zRAlMa6B6urv
         Ua9intHjnYWDOLPomM/V3XtmyHLtDiWxqV1zJ92OL4t6Ja+oZW9gL22SqjkxqGOFvj1Q
         8XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=O+nfQfUaMACIDpLI1zl3ljQDTfG64Jwg7wf2QochBqo=;
        b=uhaU/GVoD0PnOzYB+Fr1qYbhgH8m+b77AuQrnFMcSLz5744IdvSYMRXNQlO0yvYkDr
         Qo/M1TyyP6YzKJ6rz1dNWwM8ot0g9F94jCowChZyjZFbkYeG6Z1Iw2WmUzo/GUOpecHb
         PRU4jk2JRWpK4ammljEqluJFHq4nfrhF+Yo8PB3/kXZKLcHEV8hCRwPJK0jrw5OhZkiF
         /io9WdFDztFKHWjUQZ7tvAeMrSwfX2zMSaHDvmUIy/i3/AZa7u6ql1r8DiTjV422odfv
         NwHRd/Dayj93hXkKnIte/9rf5hlS7cwbGG95X/E43IEsoftPtRTXDpd1E8foLhikY3UW
         1Egw==
X-Gm-Message-State: APjAAAV+MM/HADFMY2/9nsWytVh5uDtAr+F5LS4r2zzkgcxNxrhzssq1
        kmWklZLcg+KdTeiUCu4rFBGA70KS
X-Google-Smtp-Source: APXvYqyv2+a4p5Rp/Fe3d38AYt9VwBO4k+zOsd340q2xHe+qzfwAKrunFbgiQmovTYCeKXbKj1qnsg==
X-Received: by 2002:a17:902:b713:: with SMTP id d19mr20211023pls.267.1565369529204;
        Fri, 09 Aug 2019 09:52:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i14sm3801432pfq.77.2019.08.09.09.52.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 09:52:08 -0700 (PDT)
Date:   Fri, 9 Aug 2019 09:52:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] watchdog: jz4740: Driver update
Message-ID: <20190809165207.GA18104@roeck-us.net>
References: <20190809115930.6050-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809115930.6050-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 09, 2019 at 01:59:27PM +0200, Paul Cercueil wrote:
> Hi,
> 
> This patchset comes from a bigger patchset that was cut in smaller
> pieces for easier integration to mainline.
> (The patchset was https://lkml.org/lkml/2019/3/27/1837)
> 
> The reviews were kept since the code mostly didn't change. The exception
> is the use of device_node_to_regmap() in patch 2/3. This function was
> added in a prior patch, now merged in the MIPS tree.
> 
> For that reason this patchset is based on the ingenic-tcu-v5.4 branch of
> the MIPS tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git).
> 

What is the expectation here ? Should the series be sent upstream
through the watchdog tree, or through some other tree ?

Thanks,
Guenter
