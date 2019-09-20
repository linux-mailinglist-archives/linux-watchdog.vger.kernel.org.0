Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DEB0B9578
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2019 18:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391390AbfITQXR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Sep 2019 12:23:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:41892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390632AbfITQXO (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Sep 2019 12:23:14 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3AB1E208C3;
        Fri, 20 Sep 2019 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568996594;
        bh=/gY3eyN/99Vwc+rE/mubQe3N1CXXiv7Fbgs2nWfoFDc=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=I5p+hmb6P8nedLs1fqxO6ODqniyBYw/gRUMEovWLLh1yw3O5O1q0GGiWUqwik8sOA
         J4KQSaEWgWFGD4nuUdpolKf4JfqyV5QNVcdSxNLyi13n+KU9g7P53wBElx8Z0Shnn5
         5JMp4vX8nT/yLz1zQIn2jblCh2b9N7frBmft6TGU=
Received: by mail-ot1-f47.google.com with SMTP id e11so6676220otl.5;
        Fri, 20 Sep 2019 09:23:14 -0700 (PDT)
X-Gm-Message-State: APjAAAXqb6XFz9lc+qU4/zc2Umds29HKsDmsGoERllDVbq16GwjpCtOd
        rKemTjBEATEy+RWSLX+Yk+d3DeEZH6up/rXH63k=
X-Google-Smtp-Source: APXvYqyo+eHqYY+wd1hJeskVQu73EQIp1tU7G1a9ZEYeGtJO8llZMStv0HcB/C9UjvxekPWe0ZjxxZedr3kEHQe+9Lc=
X-Received: by 2002:a05:6830:10cc:: with SMTP id z12mr6558999oto.20.1568996593576;
 Fri, 20 Sep 2019 09:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190920162124.7036-1-krzk@kernel.org>
In-Reply-To: <20190920162124.7036-1-krzk@kernel.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 20 Sep 2019 18:23:00 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcsSjVoHmCJN_AF8a2gkVN3+kQh4D+J01GnxGmMOZh4Hg@mail.gmail.com>
Message-ID: <CAJKOXPcsSjVoHmCJN_AF8a2gkVN3+kQh4D+J01GnxGmMOZh4Hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Convert Samsung SoC
 watchdog bindings to json-schema
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 20 Sep 2019 at 18:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> using json-schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Remove unneeded timeout-sec description and include generic bindings.

My bad, this is actually v3.

Best regards,
Krzysztof
