Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859E837203F
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 May 2021 21:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhECTS5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 May 2021 15:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhECTS4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 May 2021 15:18:56 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A6EEC06174A;
        Mon,  3 May 2021 12:18:02 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 103-20020a9d0d700000b02902a5baf33f37so5622019oti.9;
        Mon, 03 May 2021 12:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/3LO6jF/+3BTJn9T2NhTSlpWMbiR8D+8OE3j1TZsbEo=;
        b=px/1TsIU2wFoIo0/WMWMrK/Snv3viSx85TzoRkQ2TCIcF/6AxXi3RGgneuhtnBgNkn
         qtRy/gzKgrWf4Z+rym3cGu18G0RCkebmBRkKYN/NOlJd4kyGTtJJhIwKl1YXufe+oY15
         eBH+n7a6Icm3e2pNRgE/xdQASUzFNBF6lpGH7pSkMWe0TrYuPrDwEMrxy6Y9h6RPbMug
         vpshKxc/AHRaFdhXCPFh2LvlMgr5tKBQD8q9uY2wyknDKCPrgwDMgqNwbYXUo5SKlsoc
         R3ApZEOj9gikd1Wp9cgW6J/ECWzfIvXb/qJGB3RKExFuoy65jVynnA9h99UfMyBW5Xvy
         HsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=/3LO6jF/+3BTJn9T2NhTSlpWMbiR8D+8OE3j1TZsbEo=;
        b=iuLVuayOigRgw4VQ+ygAUV4a/DwWAkw5XB4/Fs+pRprrJf2VgV2fX8BoG0bSnJpcpz
         iI+zZh8v908bAootGVi+nOgYra0yhxqHDh/Ey9A5TmNpZDYZQW5laYj8eoDx9hL3s+xK
         x/aMePzqFDcxsZCwiYmGgoiu3VX3Xm0OOlXNCwuePbY3DdY5d2+Hc2IkrRBzZgoFGIF1
         V7oi4/MnG6DAVvlIiibNN6iS7cY6fdagJLd6aD/0Ft6takyTBsq6h//TFk8BSNANXKfk
         IiLFmVXDpBjcQ7jr3oIFLdaML6LwvhbLywbgNIQ8Lihw/7D7zi6Kcxwo0HF9Ir5ytF/s
         CF5A==
X-Gm-Message-State: AOAM530Y92xadXon5cZLb/zE/mEaM0U+6uQ86uMEUSs11vFAVqvaPXcf
        CPPJsLp30IsY50fQTY3N5p96lQeHs0o=
X-Google-Smtp-Source: ABdhPJyORtceZklf/t9kWzjJp4IJXY/aq+ybaPt4AB3YPm2gXhsSYBnSP5I0fvN2oEhWNl/RId1pwQ==
X-Received: by 2002:a9d:425:: with SMTP id 34mr16235618otc.25.1620069481632;
        Mon, 03 May 2021 12:18:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w2sm140733oov.23.2021.05.03.12.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:18:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 3 May 2021 12:17:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: clean up the Kconfig file
Message-ID: <20210503191759.GA863144@roeck-us.net>
References: <20210419000704.17745-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210419000704.17745-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Apr 18, 2021 at 05:07:03PM -0700, Randy Dunlap wrote:
> Change a non-working ftp: URL to https:.
> Wrap long lines earlier.
> Spell "IP" with capital letters.
> Change "it`s" to "it's". The backtick (grave accent) is not an apostrophe.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter
