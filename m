Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0B63B0AFC
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jun 2021 19:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhFVRC5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 13:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhFVRC5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 13:02:57 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769E7C061574;
        Tue, 22 Jun 2021 10:00:40 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso21860809otu.10;
        Tue, 22 Jun 2021 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CU73LRTmqsTJXC4hCPE4/i0AAwdr3FZJs+LzvR2IcQI=;
        b=JTfsR1QOxSzlj2vxLZxvTeR8R5YGWW3UbyZl8oBQYsB4CnGDqMUmttCi1cA3uLODi0
         hkr+ZxmFRcbPXJRyrW+vzjz1HwVRBHabLWiU38taHodnC0+cnmc3xyht3tt9KH0EalnN
         DyiOe7fQ9u5enXuTprYZcSjW/2Tua3TInECPkJZgtLMnrWUG0UoLqGxuICsn+ZhzAVXM
         oNqGrxVngIXiktfMWDUn1pkKdwBJYgSok9U2ZwmZ0nzhOmufFksClgO6DKhgd/nws4/P
         RJu/0vB+Svoau3mbXd7wuDo1OzO1FLR7j8q6fQ3s3A5Xm4hbYApg8bruOUgwTUifLUuT
         LBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=CU73LRTmqsTJXC4hCPE4/i0AAwdr3FZJs+LzvR2IcQI=;
        b=XaL1HPgkRDg5iTkFFeuI9hVo4+VOwUBPSCEFRf0PtBOQ7AX9jrfaXHoHyVLM5oWU17
         HZkmFScVb7qrQSYD2rKkSJ8L5wD+KoY4++tTfy48xErF1fcDDLL4HBXdrIw7UWhvnJDg
         VrU+8YdcCfSudeFAakyQp6fCAftbWEt6Hp3z6onSpUH1baESRWhEliljCwuC74pd7YIp
         kLaSeDYFv9fK9lZTm/VR/j9SnPOZPcAgzu1vlwaFkQvEymqzH5+lnjIwS+jKbz54ZJZ4
         hUuK/EUgeHlm9jxewl+Xc9dmTx2Ms1GPwmyMZOZOyOThHWFWqsL72wKw5beDkJSZsdkK
         Qw/A==
X-Gm-Message-State: AOAM5311Plb+FLe4t0lACX9ln1i3iJsxOOs3Rsh5zuQg95IWQ9tNIebg
        DmEoYGiBCWWGTkzJ8DPui/0=
X-Google-Smtp-Source: ABdhPJxoRFAitm/89S9nKTw10yYqZzZlkwIjYq9UXK9WgXuoqd3GuEH7Q8tIHD2Q6N3/SFxKZJ/WVw==
X-Received: by 2002:a9d:2c67:: with SMTP id f94mr3993356otb.353.1624381239886;
        Tue, 22 Jun 2021 10:00:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s123sm599767oos.12.2021.06.22.10.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 10:00:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 22 Jun 2021 10:00:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Art Nikpal <email2tema@gmail.com>, wim@linux-watchdog.org,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-kernel@vger.kernel.org, Artem Lapkin <art@khadas.com>,
        Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: improve
Message-ID: <20210622170037.GA3440464@roeck-us.net>
References: <20210622095639.1280774-1-art@khadas.com>
 <bfa12322-bc49-2337-2988-199e87e34b87@baylibre.com>
 <CAKaHn9JpH2Yh-1njO6jEnFeu-GMhbonftN=-VXdbvjdug16qHA@mail.gmail.com>
 <0d5e53b2-873e-0ffa-32eb-87e96b51e263@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d5e53b2-873e-0ffa-32eb-87e96b51e263@baylibre.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 22, 2021 at 02:43:45PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 22/06/2021 13:53, Art Nikpal wrote:
> >> Neil
> >> Can you split the patch in 4 distinct changes ?
> > 
> > yes  no problem i can try to do it tomorrow !
> > maybe somebody have other ideas, suggestion, comments ...
> 
> The changeset is clean, and overall I'm ok with the changes, but I'm pretty sure the wdt maintainers
> will prefer separate changes in order to comment of each.

Correct. As per guidelines, "one logical change per patch".

Guenter
